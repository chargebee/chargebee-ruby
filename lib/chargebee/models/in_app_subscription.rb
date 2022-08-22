module ChargeBee
  class InAppSubscription < Model

  attr_accessor :app_id, :subscription_id, :customer_id, :plan_id

  # OPERATIONS
  #-----------

  def self.process_receipt(id, params, env=nil, headers={})
    Request.send('post', uri_path("in_app_subscriptions",id.to_s,"process_purchase_command"), params, env, headers)
  end

  def self.import_receipt(id, params, env=nil, headers={})
    Request.send('post', uri_path("in_app_subscriptions",id.to_s,"import_receipt"), params, env, headers)
  end

  end # ~InAppSubscription
end # ~ChargeBee