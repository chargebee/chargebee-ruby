module ChargeBee
  class Plan < Model

  attr_accessor :id, :name, :invoice_name, :price, :period, :period_unit, :trial_period, :trial_period_unit,
  :free_quantity, :setup_cost, :downgrade_penality, :status, :archived_at, :billing_cycles, :redirect_url

  # OPERATIONS
  #-----------
    
  def self.list(params={}, env=nil)
    Request.send('get', "/plans", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/plans/#{id.to_s}", {}, env)
  end    

  end # ~Plan
end # ~ChargeBee    