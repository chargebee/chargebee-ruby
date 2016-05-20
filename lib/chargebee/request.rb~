module ChargeBee
  class Request    

    def self.send_list_request(method, url, params={}, env=nil, headers={})
      serialized = {}
      params.each do |k, v|
        if(v.kind_of? Array)
          v = v.to_json
        end
        serialized["#{k}"] = v
      end 
      self.send(method, url, serialized, env, headers) 
    end

    def self.send(method, url, params={}, env=nil, headers={})
      env ||= ChargeBee.default_env
      ser_params = Util.serialize(params)
      resp = Rest.request(method, url, env, ser_params||={}, headers)
      if resp.has_key?(:list)
        ListResult.new(resp[:list], resp[:next_offset]) 
      else 
        Result.new(resp)
      end
    end
      
  end
end
