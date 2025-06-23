module ChargeBee
  class Entitlement < Model

  attr_accessor :id, :entity_id, :entity_type, :feature_id, :feature_name, :value, :name

  # OPERATIONS
  #-----------

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("entitlements"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("entitlements"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~Entitlement
end # ~ChargeBee