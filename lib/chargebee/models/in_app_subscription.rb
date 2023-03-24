module ChargeBee
  class InAppSubscription < Model

  attr_accessor :app_id, :subscription_id, :customer_id, :plan_id, :store_status, :invoice_id

  # OPERATIONS
  #-----------

  def self.process_receipt(id, params, env=nil, headers={})
    Request.send('post', uri_path("in_app_subscriptions",id.to_s,"process_purchase_command"), params, env, headers)
  end

  def self.import_receipt(id, params, env=nil, headers={})
    Request.send('post', uri_path("in_app_subscriptions",id.to_s,"import_receipt"), params, env, headers)
  end

  def self.import_subscription(id, params, env=nil, headers={})
    Request.send('post', uri_path("in_app_subscriptions",id.to_s,"import_subscription"), params, env, headers)
  end

  def self.retrieve_store_subs(id, params, env=nil, headers={})
    Request.send('post', uri_path("in_app_subscriptions",id.to_s,"retrieve"), params, env, headers)
  end

  end # ~InAppSubscription
end # ~ChargeBee