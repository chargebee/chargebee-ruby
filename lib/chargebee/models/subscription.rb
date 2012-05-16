module ChargeBee
  class Subscription < Model

    class Addon < Model
      attr_accessor :id, :quantity
    end

  attr_accessor :id, :plan_id, :plan_quantity, :status, :trial_start, :trial_end, :current_term_start,
  :current_term_end, :created_at, :activated_at, :cancelled_at, :due_invoices_count, :due_since,
  :total_dues, :addons, :coupon

  # OPERATIONS
  #-----------
    
  def self.create(params, env=nil)
    Request.send('post', "/subscriptions", params, env)
  end    

  def self.list(params={}, env=nil)
    Request.send('get', "/subscriptions", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/subscriptions/#{id.to_s}", {}, env)
  end    

  def self.update(id, params={}, env=nil)
    Request.send('post', "/subscriptions/#{id.to_s}", params, env)
  end    

  def self.cancel(id, params={}, env=nil)
    Request.send('post', "/subscriptions/#{id.to_s}/cancel", params, env)
  end    

  def self.reactivate(id, env=nil)
    Request.send('post', "/subscriptions/#{id.to_s}/reactivate", {}, env)
  end    

  end # ~Subscription
end # ~ChargeBee    