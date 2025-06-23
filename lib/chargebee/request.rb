module ChargeBee
  class Request

    def self.send_list_request(method, url, params={}, env=nil, headers={}, sub_domain=nil, isJsonRequest=nil, jsonKeys={}, options={})
      serialized = {}
      params.each do |k, v|
        if(v.kind_of? Array)
          v = v.to_json
        end
        serialized["#{k}"] = v
      end
      self.send(method, url, serialized, env, headers, sub_domain, isJsonRequest=nil, jsonKeys={}, options)
    end

    def self.send(method, url, params={}, env=nil, headers={}, sub_domain=nil, isJsonRequest=nil, jsonKeys={}, options={})
      env ||= ChargeBee.default_env
      ser_params = isJsonRequest ? params.to_json : Util.serialize(params, nil, nil, jsonKeys)
      resp, rheaders, rcode = NativeRequest.request(method, url, env, ser_params||={}, headers, sub_domain, isJsonRequest, options)
      if resp.has_key?(:list)
        ListResult.new(resp[:list], resp[:next_offset], rheaders, rcode)
      else
        Result.new(resp, rheaders, rcode)
      end
    end

  end
end
