module ChargeBee

  class Error < StandardError
    attr_reader :original_error

    def initialize(message=nil,original_error = nil)
        super message
        @original_error = original_error
    end
  end

  class IOError < Error; end

  class APIError < Error

    attr_reader  :http_status_code, :type, :api_error_code, :param, :json_obj,
                 #Deprecated attributes
                 :http_code, :http_body, :error_code
    
    def initialize(http_code=nil, json_obj = nil)
      super json_obj[:message]
      @json_obj = json_obj
      @http_status_code = http_code
      @type = json_obj[:type]
      @api_error_code = json_obj[:api_error_code]
      @param = json_obj[:param]

      #Deprecated attributes
      @error_code = json_obj[:error_code]
      @http_code = http_code
      @http_body = json_obj.to_s
    end
    
  end


  class OperationFailedError < APIError; end

  class InvalidRequestError < APIError;  end

  class PaymentError < APIError;  end

end
