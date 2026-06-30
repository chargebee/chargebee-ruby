module ChargeBee
  class Request

    def self.send_list_request(method, url, params={}, env=nil, headers={}, sub_domain=nil, isJsonRequest=nil, jsonKeys={}, options={}, telemetry_resource=nil, telemetry_operation=nil)
      serialized = {}
      params.each do |k, v|
        if(v.kind_of? Array)
          v = v.to_json
        end
        serialized["#{k}"] = v
      end
      self.send(method, url, serialized, env, headers, sub_domain, isJsonRequest, jsonKeys, options, telemetry_resource, telemetry_operation)
    end

    def self.send(method, url, params={}, env=nil, headers={}, sub_domain=nil, isJsonRequest=nil, jsonKeys={}, options={}, telemetry_resource=nil, telemetry_operation=nil)
      telemetry_resource, telemetry_operation = normalize_telemetry_args(telemetry_resource, telemetry_operation)
      env ||= ChargeBee.default_env
      ser_params = isJsonRequest ? params : Util.serialize(params, nil, nil, jsonKeys)
      http_url = TelemetryExecutor.build_http_url(env, sub_domain, url)

      TelemetryExecutor.execute(
        env,
        telemetry_resource: telemetry_resource,
        telemetry_operation: telemetry_operation,
        method: method,
        http_url: http_url,
        request_headers: headers,
      ) do |telemetry_headers|
        merged_headers = headers.dup
        telemetry_headers&.each { |key, value| merged_headers[key] = value }
        resp, rheaders, rcode = NativeRequest.request(method, url, env, ser_params||={}, merged_headers, sub_domain, isJsonRequest, options)
        result = if resp&.has_key?(:list)
          ListResult.new(resp[:list], resp[:next_offset], rheaders, rcode)
        else
          Result.new(resp, rheaders, rcode)
        end
        [rcode.to_i, result]
      end
    end

    def self.normalize_telemetry_args(telemetry_resource, telemetry_operation)
      if telemetry_resource.is_a?(Hash) && telemetry_operation.nil? &&
         (telemetry_resource.key?(:telemetry_resource) || telemetry_resource.key?(:telemetry_operation))
        h = telemetry_resource
        return [h[:telemetry_resource], h[:telemetry_operation]]
      end

      [telemetry_resource, telemetry_operation]
    end
    private_class_method :normalize_telemetry_args

  end
end
