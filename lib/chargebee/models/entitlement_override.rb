module ChargeBee
  class EntitlementOverride < Model

  attr_accessor :id, :subscription_id, :entity_id, :entity_type, :feature_id, :feature_name, :value,
  :name, :expires_at, :effective_from, :is_enabled, :schedule_status

  # OPERATIONS
  #-----------

  def self.add_entitlement_override_for_subscription(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("subscriptions",id.to_s,"entitlement_overrides"), params, env, headers,nil, false, jsonKeys, options, "entitlementOverride", "addEntitlementOverrideForSubscription")
  end

  def self.list_entitlement_override_for_subscription(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("subscriptions",id.to_s,"entitlement_overrides"), params, env, headers,nil, false, jsonKeys, options, "entitlementOverride", "listEntitlementOverrideForSubscription")
  end

  end # ~EntitlementOverride
end # ~ChargeBee