module ChargeBee
  class Request

    def self.send_list_request(method, url, params={}, env=nil, headers={}, sub_domain=nil, isJsonRequest=nil, jsonKeys={}, options={}, telemetry_resource: nil, telemetry_operation: nil)
      serialized = {}
      params.each do |k, v|
        if(v.kind_of? Array)
          v = v.to_json
        end
        serialized["#{k}"] = v
      end
      self.send(method, url, serialized, env, headers, sub_domain, isJsonRequest, jsonKeys, options, telemetry_resource: telemetry_resource, telemetry_operation: telemetry_operation)
    end

    def self.send(method, url, params={}, env=nil, headers={}, sub_domain=nil, isJsonRequest=nil, jsonKeys={}, options={}, telemetry_resource: nil, telemetry_operation: nil)
      env ||= ChargeBee.default_env
      ser_params = isJsonRequest ? params : Util.serialize(params, nil, nil, jsonKeys)
      http_url = TelemetryExecutor.build_http_url(env, sub_domain, url)

      TelemetryExecutor.execute(
        env,
        telemetry_resource: telemetry_resource,
        telemetry_operation: telemetry_operation,
        method: method,
        http_url: http_url,
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

  end
end
