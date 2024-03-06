module ChargeBee
  class NonSubscription < Model

  attr_accessor :app_id, :invoice_id, :customer_id, :charge_id

  # OPERATIONS
  #-----------

  def self.process_receipt(id, params, env=nil, headers={})
    Request.send('post', uri_path("non_subscriptions",id.to_s,"one_time_purchase"), params, env, headers)
  end

  end # ~NonSubscription
end # ~ChargeBee