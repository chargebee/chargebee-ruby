module ChargeBee
  class Environment
    API_VERSION = "v2"
    # in seconds
    TIME_MACHINE_TIMEOUT = 3
    EXPORT_TIMEOUT = 10
    CONNECT_TIMEOUT = 30
    READ_TIMEOUT = 80

    attr_accessor :api_key, :site, :time_machine_sleeptime, :export_sleeptime, :connect_timeout, :read_timeout
    attr_reader :api_endpoint

    def initialize(options)
      options[:time_machine_sleeptime] ||= TIME_MACHINE_TIMEOUT
      options[:export_sleeptime] ||= EXPORT_TIMEOUT
      options[:connect_timeout] ||= CONNECT_TIMEOUT
      options[:read_timeout] ||= READ_TIMEOUT
      [:api_key, :site, :time_machine_sleeptime, :export_sleeptime, :connect_timeout, :read_timeout].each do |attr|
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