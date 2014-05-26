module ChargeBee
  class Plan < Model

  attr_accessor :id, :name, :invoice_name, :price, :period, :period_unit, :trial_period, :trial_period_unit,
  :free_quantity, :setup_cost, :downgrade_penalty, :status, :archived_at, :billing_cycles, :redirect_url

  # OPERATIONS
  #-----------

  def self.create(params, env=nil)
    Request.send('post', uri_path("plans"), params, env)
  end

  def self.update(id, params={}, env=nil)
    Request.send('post', uri_path("plans",id.to_s), params, env)
  end

  def self.list(params={}, env=nil)
    Request.send('get', uri_path("plans"), params, env)
  end

  def self.retrieve(id, env=nil)
    Request.send('get', uri_path("plans",id.to_s), {}, env)
  end

  def self.delete(id, env=nil)
    Request.send('post', uri_path("plans",id.to_s,"delete"), {}, env)
  end

  end # ~Plan
end # ~ChargeBee