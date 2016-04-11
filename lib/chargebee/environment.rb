module ChargeBee
  class Environment
    API_VERSION = "v2" 
    attr_accessor :api_key, :site
    attr_reader :api_endpoint 
      
    def initialize(options)
      [:api_key, :site].each do |attr|
        instance_variable_set "@#{attr}", options[attr]
      end
      if($CHARGEBEE_DOMAIN == nil)
        @api_endpoint = "https://#{@site}.chargebee.com/api/#{API_VERSION}"
      else
        @api_endpoint = "#{$ENV_PROTOCOL == nil ? "http": "https"}://#{@site}.#{$CHARGEBEE_DOMAIN}/api/#{API_VERSION}"
      end
    end

    def api_url(url)
      url = @api_endpoint + url
    end
    
  end
end
