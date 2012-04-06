module ChargeBee
  class APIError < StandardError

    attr_reader :message, :http_code, :http_body, :json_obj, :error_code, :param
    
    def initialize(message=nil, http_code=nil, http_body=nil, json_obj = nil)
      @message = message
      @http_code = http_code
      @http_body = http_body
      @json_obj = json_obj
      if(json_obj != nil)
        @error_code = json_obj[:error_code]
        @param = json_obj[:param]
      end
    end

  end
end