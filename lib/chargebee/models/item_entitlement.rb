module ChargeBee
  class ItemEntitlement < Model

  attr_accessor :id, :item_id, :item_type, :feature_id, :feature_name, :value, :name

  # OPERATIONS
  #-----------

  def self.item_entitlements_for_item(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("items",id.to_s,"item_entitlements"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.item_entitlements_for_feature(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("features",id.to_s,"item_entitlements"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.add_item_entitlements(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("features",id.to_s,"item_entitlements"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.upsert_or_remove_item_entitlements_for_item(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("items",id.to_s,"item_entitlements"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~ItemEntitlement
end # ~ChargeBee