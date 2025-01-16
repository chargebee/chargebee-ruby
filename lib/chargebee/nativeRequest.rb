require 'json'
require 'net/http'
require 'uri'
require 'stringio'

module ChargeBee
  module NativeRequest

    def self.request(method, url, env, params = nil, headers = {})
      raise Error.new('No environment configured.') unless env
      api_key = env.api_key

      uri = URI(env.api_url(url))

      case method.to_s.downcase.to_sym
      when :get, :head, :delete
        uri.query = URI.encode_www_form(params) if params
        payload = nil
      else
        payload = URI.encode_www_form(params || {})
      end
      user_agent = ChargeBee.user_agent
      headers = {
        "User-Agent" => user_agent,
        "Accept" => "application/json",
        "Lang-Version" => RUBY_VERSION,
        "OS-Version" => RUBY_PLATFORM,
        "Content-Type" => "application/x-www-form-urlencoded"
      }.merge(headers)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.open_timeout=env.connect_timeout
      http.read_timeout=env.read_timeout
      if ChargeBee.verify_ca_certs?
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        http.ca_file = ChargeBee.ca_cert_path
      else
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      request_class = case method.to_s.downcase.to_sym
                      when :get then Net::HTTP::Get
                      when :post then Net::HTTP::Post
                      when :put then Net::HTTP::Put
                      when :delete then Net::HTTP::Delete
                      else raise Error.new("Unsupported HTTP method: #{method}")
                      end

      request = request_class.new(uri, headers)
      request.body = payload if payload

      request.basic_auth(api_key, nil)
      begin
        response = http.request(request)
      rescue => e
        raise IOError.new("IO Exception when trying to connect to ChargeBee with URL #{uri} . Reason: #{e}", e)
      end
      handle_response(response, headers)
    end

    def self.handle_response(response, headers)
      rcode = response.code.to_i
      rbody = response.body

      # converting headers to rest-client format previously we were using rest-client,
      # and mapping headers to that format to support backward compatability
      rheaders = beautify_headers(response.to_hash)

      # When a custom 'Accept-Encoding' header is set to gzip, Net::HTTP will not automatically
      # decompress the response. Therefore, we need to manually handle decompression
      # based on the 'Content-Encoding' header in the response.
      # https://github.com/ruby/ruby/blob/19c1f0233eb5202403c52b196f1d573893eacab7/lib/net/http/generic_request.rb#L82
      if headers.keys.any? { |k| k.downcase == 'accept-encoding' } && rheaders[:content_encoding] == 'gzip' && rbody && !rbody.empty?
        rbody = Zlib::GzipReader.new(StringIO.new(rbody)).read
      end

      if rcode >= 200 && rcode < 300
        begin
          resp = JSON.parse(rbody)
        rescue JSON::ParserError => e
          raise handle_json_error(rbody, e)
        end
        return Util.symbolize_keys(resp), rheaders
      else
        raise handle_for_error(rcode, rbody)
      end
    end

    def self.handle_json_error(rbody, e)
      if rbody.include?("503")
        raise Error.new("Sorry, the server is currently unable to handle the request due to a temporary overload or scheduled maintenance. Please retry after sometime. \n type: internal_temporary_error, \n http_status_code: 503, \n error_code: internal_temporary_error,\n content: #{rbody.inspect}",e)
      elsif rbody.include?("504")
        raise Error.new("The server did not receive a timely response from an upstream server, request aborted. If this problem persists, contact us at support@chargebee.com. \n type: gateway_timeout, \n http_status_code: 504, \n error_code: gateway_timeout,\n content:  #{rbody.inspect}",e)
      else
        raise Error.new("Sorry, something went wrong when trying to process the request. If this problem persists, contact us at support@chargebee.com. \n type: internal_error, \n http_status_code: 500, \n error_code: internal_error,\n content:  #{rbody.inspect}",e)
      end
    end

    def self.handle_for_error(rcode, rbody)
      return Error.new("No response returned by ChargeBee API. HTTP status code: #{rcode}") if rcode == 204
      begin
        error_obj = JSON.parse(rbody)
        error_obj = Util.symbolize_keys(error_obj)
      rescue Exception => e
        raise Error.new("Error response not in JSON format. The http status code is #{rcode} \n #{rbody.inspect}",e)
      end
      type = error_obj[:type]
      case type
      when "payment"
        raise PaymentError.new(rcode, error_obj)
      when "operation_failed"
        raise OperationFailedError.new(rcode, error_obj)
      when "invalid_request"
        raise InvalidRequestError.new(rcode, error_obj)
      else
        raise APIError.new(rcode, error_obj)
      end
    end
    # directly copying headers formatting from rest-client to support backward compatability for rest-client
    def self.beautify_headers(headers)
      headers.inject({}) do |out, (key, value)|
        key_sym = key.tr('-', '_').downcase.to_sym

        # Handle Set-Cookie specially since it cannot be joined by comma.
        if key.downcase == 'set-cookie'
          out[key_sym] = value
        else
          out[key_sym] = value.join(', ')
        end

        out
      end
    end
  end
end
