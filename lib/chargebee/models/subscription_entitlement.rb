module ChargeBee
  class SubscriptionEntitlement < Model

    class Component < Model
      attr_accessor :entitlement_overrides
    end

  attr_accessor :subscription_id, :feature_id, :feature_name, :feature_unit, :feature_type, :value,
  :name, :is_overridden, :is_enabled, :effective_from, :schedule_status, :expires_at, :components

  # OPERATIONS
  #-----------

  def self.subscription_entitlements_for_subscription(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s,"subscription_entitlements"), params, env, headers)
  end

  def self.set_subscription_entitlement_availability(id, params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"subscription_entitlements/set_availability"), params, env, headers)
  end

  end # ~SubscriptionEntitlement
end # ~ChargeBee