module ChargeBee
  class OmnichannelSubscriptionItemScheduledChange < Model

    class CurrentState < Model
      attr_accessor :item_id_at_source
    end

    class ScheduledState < Model
      attr_accessor :item_id_at_source
    end

  attr_accessor :id, :omnichannel_subscription_item_id, :scheduled_at, :change_type, :created_at,
  :modified_at, :resource_version, :current_state, :scheduled_state

  # OPERATIONS
  #-----------

  end # ~OmnichannelSubscriptionItemScheduledChange
end # ~ChargeBee