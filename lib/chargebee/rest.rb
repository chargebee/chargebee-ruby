require 'rest_client'
require 'json'

module ChargeBee
  module Rest
    
    def self.request(method, url, env, params=nil, headers={})
      raise Error.new('No environment configured.') unless env
      api_key = env.api_key
      
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
        
      user_agent = ChargeBee.user_agent 
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
      rescue RestClient::ExceptionWithResponse => e
        if rcode = e.http_code and rbody = e.http_body
            raise handle_for_error(e, rcode, rbody)
        else
            raise IOError.new("IO Exception when trying to connect to chargebee with url #{opts[:url]} . Reason #{e}",e)
        end
      rescue Exception => e
            raise IOError.new("IO Exception when trying to connect to chargebee with url #{opts[:url]} . Reason #{e}",e)        
      end
      rbody = response.body
      rcode = response.code
      begin
        resp = JSON.parse(rbody)
      rescue Exception => e
        raise Error.new("Response not in JSON format. Probably not a ChargeBee response \n #{rbody.inspect}",e)
      end
      resp = Util.symbolize_keys(resp)
      resp
    end
    
    def self.handle_for_error(e, rcode=nil, rbody=nil)
      if(rcode == 204)
        raise Error.new("No response returned by the chargebee api. The http status code is #{rcode}")
      end
      begin
        error_obj = JSON.parse(rbody)
        error_obj = Util.symbolize_keys(error_obj)
      rescue Exception => e
        raise Error.new("Error response not in JSON format. The http status code is #{rcode} \n #{rbody.inspect}",e)
      end
      type = error_obj[:type]
      if("payment" == type)
        raise PaymentError.new(rcode, error_obj)
      elsif("operation_failed" == type)
        raise OperationFailedError.new(rcode, error_obj)
      elsif("invalid_request" == type)
        raise InvalidRequestError.new(rcode, error_obj)
      else
        raise APIError.new(rcode, error_obj)
      end
      
    end
    
  end
end
