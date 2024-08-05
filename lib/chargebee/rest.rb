require 'rest-client'
require 'json'

module ChargeBee
  module Rest
    def self.request(method, url, env, params=nil, headers={})
      raise Error.new('No environment configured.') unless env
      api_key = env.api_key

      ssl_opts = if ChargeBee.verify_ca_certs?
        {
          verify_ssl: OpenSSL::SSL::VERIFY_PEER,
          ssl_ca_file: ChargeBee.ca_cert_path
        }
      else
        { verify_ssl: false }
      end

      headers = {
        "User-Agent" => ChargeBee.user_agent,
        accept: :json,
        "Lang-Version" => RUBY_VERSION,
        "OS-Version" => RUBY_PLATFORM
      }.merge(headers)

      payload = nil
      if [:get, :head, :delete].include?(method.to_s.downcase.to_sym)
        headers[:params] = params
      else
        payload = params
      end

      opts = {
        method: method,
        url: env.api_url(url),
        user: api_key,
        headers: headers,
        payload: payload,
        open_timeout: env.connect_timeout,
        timeout: env.read_timeout
      }.merge(ssl_opts)

      begin
        response = RestClient::Request.execute(opts)
        handle_successful_response(response)
      rescue RestClient::ExceptionWithResponse => e
        handle_error_response(e)
      rescue Exception => e
        raise IOError.new("IO Exception when trying to connect to chargebee with url #{opts[:url]}. Reason: #{e}", e)
      end
    end

    def self.handle_successful_response(response)
      rheaders = response.headers
      rbody = response.body
      rcode = response.code

      begin
        resp = JSON.parse(rbody, symbolize_names: true)
      rescue JSON::ParserError
        rbody = decompress_gzip(rbody) if gzipped?(rheaders)
        begin
          resp = JSON.parse(rbody, symbolize_names: true)
        rescue JSON::ParserError
          raise Error.new("Failed to parse JSON response. HTTP status code: #{rcode}, Body: #{rbody.inspect}")
        end
      end

      [resp, rheaders]
    end

    def self.handle_error_response(e)
      rcode = e.http_code
      rbody = e.http_body

      if rcode == 204
        raise Error.new("No response returned by the chargebee api. The http status code is #{rcode}")
      end

      begin
        rbody = decompress_gzip(rbody) if gzipped?(e.response.headers)
        error_obj = JSON.parse(rbody, symbolize_names: true)
      rescue JSON::ParserError
        raise Error.new("Error response not in JSON format. The http status code is #{rcode} \n #{rbody.inspect}", e)
      end

      case error_obj[:type]
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

    def self.gzipped?(headers)
      headers[:content_encoding] == 'gzip'
    end

    def self.decompress_gzip(body)
      Zlib::GzipReader.new(StringIO.new(body)).read
    rescue Zlib::Error
      body # Return original body if decompression fails
    end
  end
end