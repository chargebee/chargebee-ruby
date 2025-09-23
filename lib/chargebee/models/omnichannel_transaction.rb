module ChargeBee
  class OmnichannelTransaction < Model

    class LinkedOmnichannelSubscription < Model
      attr_accessor :omnichannel_subscription_id
    end

    class LinkedOmnichannelOneTimeOrder < Model
      attr_accessor :omnichannel_one_time_order_id
    end

  attr_accessor :id, :id_at_source, :app_id, :price_currency, :price_units, :price_nanos, :type,
  :transacted_at, :created_at, :resource_version, :linked_omnichannel_subscriptions, :linked_omnichannel_one_time_orders

  # OPERATIONS
  #-----------

  end # ~OmnichannelTransaction
end # ~ChargeBee