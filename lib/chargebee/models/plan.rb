module ChargeBee
  class Plan < Model

  attr_accessor :id, :name, :invoice_name, :price, :period, :period_unit, :trial_period, :trial_period_unit,
  :setup_cost, :status, :archived_at

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