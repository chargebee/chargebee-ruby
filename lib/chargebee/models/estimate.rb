module ChargeBee
  class Estimate < Model

  attr_accessor :created_at, :subscription_estimate, :invoice_estimate, :next_invoice_estimate,
  :credit_note_estimates, :unbilled_charge_estimates

  # OPERATIONS
  #-----------

  def self.create_subscription(params, env=nil, headers={})
    Request.send('post', uri_path("estimates","create_subscription"), params, env, headers)
  end

  def self.create_sub_for_customer_estimate(id, params, env=nil, headers={})
    Request.send('get', uri_path("customers",id.to_s,"create_subscription_estimate"), params, env, headers)
  end

  def self.update_subscription(params, env=nil, headers={})
    Request.send('post', uri_path("estimates","update_subscription"), params, env, headers)
  end

  def self.renewal_estimate(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s,"renewal_estimate"), params, env, headers)
  end

  end # ~Estimate
end # ~ChargeBee