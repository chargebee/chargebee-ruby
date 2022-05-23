module ChargeBee
  class SubscriptionEntitlement < Model

    class Component < Model
      attr_accessor 
    end

    class EmbeddedResource < Model
      attr_accessor 
    end

  attr_accessor :id, :subscription_id, :feature_id, :feature_name, :feature_unit, :value, :name,
  :is_overridden, :is_enabled, :expires_at, :components, :embedded

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