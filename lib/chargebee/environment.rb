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

    # Add retry_config and enable_debug_logs
    attr_accessor :retry_config, :enable_debug_logs

    def initialize(options)
      options[:time_machine_sleeptime] ||= TIME_MACHINE_TIMEOUT
      options[:export_sleeptime] ||= EXPORT_TIMEOUT
      options[:connect_timeout] ||= CONNECT_TIMEOUT
      options[:read_timeout] ||= READ_TIMEOUT
      [:api_key, :site, :time_machine_sleeptime, :export_sleeptime, :connect_timeout, :read_timeout].each do |attr|
        instance_variable_set "@#{attr}", options[attr]
      end
      @retry_config = options[:retry_config]
      @enable_debug_logs = options[:enable_debug_logs] || false
      if($CHARGEBEE_DOMAIN == nil)
        @api_endpoint = "https://#{@site}.chargebee.com/api/#{API_VERSION}"
      else
        @api_endpoint = "#{$ENV_PROTOCOL == nil ? "http": "https"}://#{@site}.#{$CHARGEBEE_DOMAIN}/api/#{API_VERSION}"
      end
    end

    def api_url(url, sub_domain = nil)
      protocol = $ENV_PROTOCOL || "https"
      domain   = $CHARGEBEE_DOMAIN || "chargebee.com"

      if sub_domain
        @api_endpoint = "#{protocol}://#{@site}.#{sub_domain}.#{domain}/api/#{API_VERSION}"
      else
        @api_endpoint = "#{protocol}://#{@site}.#{domain}/api/#{API_VERSION}"
      end
        @api_endpoint + url
    end
  end
end