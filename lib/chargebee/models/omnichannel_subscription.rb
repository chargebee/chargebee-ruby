module ChargeBee
  class OmnichannelSubscription < Model

    class OmnichannelTransaction < Model
      attr_accessor :id, :id_at_source, :app_id, :price_currency, :price_units, :price_nanos, :type, :transacted_at, :created_at, :resource_version
    end

  attr_accessor :id, :id_at_source, :app_id, :source, :customer_id, :created_at, :resource_version,
  :omnichannel_subscription_items, :initial_purchase_transaction

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("omnichannel_subscriptions",id.to_s), {}, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("omnichannel_subscriptions"), params, env, headers)
  end

  def self.omnichannel_transactions_for_omnichannel_subscription(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("omnichannel_subscriptions",id.to_s,"omnichannel_transactions"), params, env, headers)
  end

  end # ~OmnichannelSubscription
end # ~ChargeBee