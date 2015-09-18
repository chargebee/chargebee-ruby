module ChargeBee
  class Plan < Model

  attr_accessor :id, :name, :invoice_name, :description, :price, :period, :period_unit, :trial_period,
  :trial_period_unit, :charge_model, :free_quantity, :setup_cost, :downgrade_penalty, :status,
  :archived_at, :billing_cycles, :redirect_url, :enabled_in_hosted_pages, :invoice_notes, :taxable

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("plans"), params, env, headers)
  end

  def self.update(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("plans",id.to_s), params, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send('get', uri_path("plans"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("plans",id.to_s), {}, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("plans",id.to_s,"delete"), {}, env, headers)
  end

  end # ~Plan
end # ~ChargeBee