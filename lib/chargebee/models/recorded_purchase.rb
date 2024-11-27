module ChargeBee
  class RecordedPurchase < Model

    class LinkedOmnichannelSubscription < Model
      attr_accessor :omnichannel_subscription_id
    end

    class ErrorDetail < Model
      attr_accessor :error_message
    end

  attr_accessor :id, :customer_id, :app_id, :source, :status, :omnichannel_transaction_id, :created_at,
  :resource_version, :linked_omnichannel_subscriptions, :error_detail

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("recorded_purchases"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("recorded_purchases",id.to_s), {}, env, headers)
  end

  end # ~RecordedPurchase
end # ~ChargeBee