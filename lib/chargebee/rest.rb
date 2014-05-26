require 'rest_client'
require 'json'

module ChargeBee
  module Rest
    
    def self.request(method, url, env, params=nil)
      raise APIError.new('No environment configured.') unless env
      api_key = env.api_key
      headers = {}
      
      if(ChargeBee.verify_ca_certs?)
        ssl_opts = {
          :verify_ssl => OpenSSL::SSL::VERIFY_PEER,
          :ssl_ca_file => ChargeBee.ca_cert_path
        }
      else
        ssl_opts = {
          :verify_ssl => false
        }
      end
      case method.to_s.downcase.to_sym
      when :get, :head, :delete
        headers = { :params => params }.merge(headers)
        payload = nil
      else
        payload = params
      end
      
      user_agent = "Chargebee-Ruby-Client v#{ChargeBee::VERSION}"
      headers = { 
        "User-Agent" => user_agent,
        :accept => :json 
        }.merge(headers)      
      opts = {
        :method => method,
        :url => env.api_url(url),
        :user => api_key,
        :headers => headers,
        :payload => payload,
        :open_timeout => 50,
        :timeout => 100
        }.merge(ssl_opts)
        
      begin
        response = RestClient::Request.execute(opts)
      rescue Exception => e
        case(e)
        when SocketError
          raise APIError.new("Error while connecting to chargebee. If you see this repeatedly, contact us at support@chargebee.com")
        when RestClient::ExceptionWithResponse
          if rcode = e.http_code and rbody = e.http_body
            raise handle_for_error(e, rcode, rbody)
          else
            raise APIError.new(e.message)
          end
        when RestClient::Exception
          raise APIError.new("Unexpected error received: #{e.message}", e.http_code, e.http_body)
        else
          raise APIError.new(e.message)
        end
      end
      rbody = response.body
      rcode = response.code
      begin
        resp = JSON.parse(rbody)
      rescue JSON::ParserError
        raise APIError.new("Invalid response object from API", rcode, rbody)
      end

      resp = Util.symbolize_keys(resp)
      resp
    end
    
    def self.handle_for_error(e, rcode=nil, rbody=nil)
      if(rcode == 204)
        raise APIError.new("No response returned by the chargebee api", rcode)
      end
      begin
        error_obj = JSON.parse(rbody)
        error_obj = Util.symbolize_keys(error_obj)
      rescue JSON::ParseError
        raise APIError.new("Invalid JSON response #{rbody.inspect} received with HTTP response code #{rcode}", rcode, rbody)
      end
      raise APIError.new(error_obj.to_s, rcode, rbody, error_obj)
    end
    
  end
end