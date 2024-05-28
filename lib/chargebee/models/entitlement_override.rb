module ChargeBee
  class EntitlementOverride < Model

  attr_accessor :id, :entity_id, :entity_type, :feature_id, :feature_name, :value, :name, :expires_at,
  :effective_from, :schedule_status

  # OPERATIONS
  #-----------

  def self.add_entitlement_override_for_subscription(id, params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"entitlement_overrides"), params, env, headers)
  end

  def self.list_entitlement_override_for_subscription(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s,"entitlement_overrides"), params, env, headers)
  end

  end # ~EntitlementOverride
end # ~ChargeBee