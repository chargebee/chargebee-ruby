module ChargeBee
  class Purchase < Model

  attr_accessor :id, :customer_id, :created_at, :modified_at, :subscription_ids, :invoice_ids

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("purchases"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("purchases",id.to_s), {}, env, headers)
  end

  def self.estimate(params, env=nil, headers={})
    Request.send('post', uri_path("purchases","estimate"), params, env, headers)
  end

  end # ~Purchase
end # ~ChargeBee