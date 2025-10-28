require 'json'
require 'net/http'
require 'uri'
require 'stringio'
require 'zlib'
require 'securerandom'

module ChargeBee
  module NativeRequest
    def self.request(method, url, env, params = nil, headers = {}, subdomain = nil, isJsonRequest = false, options={})
      raise Error.new('No environment configured.') unless env
      api_key = env.api_key

      uri = build_uri(method, env.api_url(url, subdomain), params)

      payload = build_payload(method, params, isJsonRequest)
      request = build_http_request(method, uri, headers, isJsonRequest)
      request.body = payload if payload
      request.basic_auth(api_key, nil)
      http = configure_http_client(uri, env)

      retry_config = env.retry_config || {}
      retry_enabled = retry_config[:enabled] == true
      max_retries = retry_enabled ? (retry_config[:max_retries] || 3) : 0
      delay_ms = retry_enabled ? (retry_config[:delay_ms] || 500) : 0
      retry_on = retry_config[:retry_on] || [500, 502, 503, 504]
      enable_debug = env.enable_debug_logs

      attempts = 0
      response = nil

      while attempts <= max_retries
        begin
          attempts += 1
          if attempts > 0
            request["X-CB-Retry-Attempt"] = attempts.to_s
            if options[:isIdempotent] && request["chargebee-idempotency-key"].nil?
              request["chargebee-idempotency-key"] = SecureRandom.uuid
            end
          end
          response = http.request(request)

          break unless retry_enabled && retry_on.include?(response.code.to_i) && attempts <= max_retries

          retry_delay = extract_retry_delay(response, delay_ms, attempts)
          puts "[ChargeBee] Retrying request (status #{response.code}) attempt #{attempts} after #{retry_delay.round(2)}s" if enable_debug
          sleep(retry_delay)
        rescue => e
          puts "[ChargeBee] HTTP request failed on attempt #{attempts}: #{e}" if enable_debug

          if retry_enabled && attempts <= max_retries
            retry_delay = backoff_delay(delay_ms, attempts)
            sleep(retry_delay)
            next
          else
            raise IOError.new("IO Exception when trying to connect to ChargeBee with URL #{uri} . Reason: #{e}", e)
          end
        end
      end

      handle_response(response, headers)
    end

    def self.build_uri(method, url, params)
      uri = URI(url)
      if %i[get head delete].include?(method.to_s.downcase.to_sym) && params
        uri.query = URI.encode_www_form(params)
      end
      uri
    end

    def self.build_payload(method, params, is_json)
      if %i[get head delete].include?(method.to_s.downcase.to_sym)
        nil
      else
        is_json ? params.to_json : URI.encode_www_form(params || {})
      end
    end

    def self.build_http_request(method, uri, custom_headers, is_json)
      request_class = {
                        get: Net::HTTP::Get,
                        post: Net::HTTP::Post,
                        put: Net::HTTP::Put,
                        delete: Net::HTTP::Delete
                      }[method.to_s.downcase.to_sym] || raise(Error.new("Unsupported HTTP method: #{method}"))

      content_type = is_json ? "application/json;charset=UTF-8" : "application/x-www-form-urlencoded"

      headers = {
        "User-Agent" => ChargeBee.user_agent,
        "Accept" => "application/json",
        "Lang-Version" => RUBY_VERSION,
        "OS-Version" => RUBY_PLATFORM,
        "Content-Type" => content_type
      }.merge(custom_headers)

      request_class.new(uri, headers)
    end

    def self.configure_http_client(uri, env)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.open_timeout = env.connect_timeout
      http.read_timeout = env.read_timeout
      if ChargeBee.verify_ca_certs?
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        http.ca_file = ChargeBee.ca_cert_path
      else
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      http
    end

    def self.extract_retry_delay(response, delay_ms, attempt)
      retry_after = response['Retry-After']
      retry_after_delay = Integer(retry_after) rescue 0
      if retry_after_delay > 0
        retry_after_delay
      else
        backoff_delay(delay_ms, attempt)
      end
    end

    def self.backoff_delay(delay_ms, attempt)
      jitter = rand(100)
      (delay_ms * (2 ** (attempt - 1)) + jitter) / 1000.0
    end

    def self.handle_response(response, headers)
      rcode = response.code.to_i
      rbody = response.body
      rheaders = beautify_headers(response.to_hash)

      if rheaders[:content_encoding] == 'gzip' && rbody && !rbody.empty?
        rbody = decompress_gzip(rbody)
      end

      if rcode >= 200 && rcode < 300
        begin
          resp = rcode == 204 ? rbody : JSON.parse(rbody)
        rescue JSON::ParserError => e
          raise handle_json_error(rbody, e)
        end
        return Util.symbolize_keys(resp), rheaders, rcode
      else
        raise handle_for_error(rcode, rbody)
      end
    end

    def self.decompress_gzip(rbody)
      gz = Zlib::GzipReader.new(StringIO.new(rbody))
      begin
        gz.read
      ensure
        gz.close
      end
    end

    def self.handle_json_error(rbody, e)
      if rbody.include?("503")
        raise Error.new("Sorry, the server is currently unable to handle the request due to a temporary overload or scheduled maintenance. Please retry after sometime. \n type: internal_temporary_error, \n http_status_code: 503, \n error_code: internal_temporary_error,\n content: #{rbody.inspect}", e)
      elsif rbody.include?("504")
        raise Error.new("The server did not receive a timely response from an upstream server, request aborted. If this problem persists, contact us at support@chargebee.com. \n type: gateway_timeout, \n http_status_code: 504, \n error_code: gateway_timeout,\n content:  #{rbody.inspect}", e)
      else
        raise Error.new("Sorry, something went wrong when trying to process the request. If this problem persists, contact us at support@chargebee.com. \n type: internal_error, \n http_status_code: 500, \n error_code: internal_error,\n content:  #{rbody.inspect}", e)
      end
    end

    # Handle errors returned by the ChargeBee API.
    #
    # @param rcode [Integer] HTTP status code.
    # @param rbody [String] HTTP response body.
    #
    # @return [ChargeBee::Error] Appropriate ChargeBee error object.
    def self.handle_for_error(rcode, rbody)
      return Error.new("No response returned by ChargeBee API. HTTP status code: #{rcode}") if rcode == 204
      return ForbiddenError.new("Access forbidden. You do not have permission to access this resource.") if rcode == 403
      begin
        error_obj = JSON.parse(rbody)
        error_obj = Util.symbolize_keys(error_obj)
      rescue Exception => e
        return Error.new("Error response not in JSON format. The http status code is #{rcode} \n #{rbody.inspect}", e)
      end

      case error_obj[:type]
      when "payment"
        PaymentError.new(rcode, error_obj)
      when "operation_failed"
        OperationFailedError.new(rcode, error_obj)
      when "invalid_request"
        InvalidRequestError.new(rcode, error_obj)
      when "ubb_batch_ingestion_invalid_request"
        UbbBatchIngestionInvalidRequestError.new(rcode, error_obj)
      else
        APIError.new(rcode, error_obj)
      end
    end

    def self.beautify_headers(headers)
      headers.each_with_object({}) do |(key, value), out|
        key_sym = key.tr('-', '_').downcase.to_sym
        out[key_sym] = key.downcase == 'set-cookie' ? value : value.join(', ')
      end
    end
  end
end
