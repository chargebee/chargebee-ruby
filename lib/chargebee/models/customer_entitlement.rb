module ChargeBee
  class CustomerEntitlement < Model

  attr_accessor :customer_id, :subscription_id, :feature_id, :value, :name, :is_enabled

  # OPERATIONS
  #-----------

  def self.entitlements_for_customer(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('get', uri_path("customers",id.to_s,"customer_entitlements"), params, env, headers,nil, false, jsonKeys)
  end

  end # ~CustomerEntitlement
end # ~ChargeBee