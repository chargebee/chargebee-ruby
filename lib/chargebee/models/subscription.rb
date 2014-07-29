module ChargeBee
  class Subscription < Model

    class Addon < Model
      attr_accessor :id, :quantity
    end

    class Coupon < Model
      attr_accessor :coupon_id, :apply_till, :applied_count, :coupon_code
    end

    class ShippingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state, :country, :zip
    end

  attr_accessor :id, :plan_id, :plan_quantity, :status, :start_date, :trial_start, :trial_end,
  :current_term_start, :current_term_end, :remaining_billing_cycles, :created_at, :started_at,
  :activated_at, :cancelled_at, :cancel_reason, :due_invoices_count, :due_since, :total_dues,
  :addons, :coupon, :coupons, :shipping_address

  # OPERATIONS
  #-----------

  def self.create(params, env=nil)
    Request.send('post', uri_path("subscriptions"), params, env)
  end

  def self.create_for_customer(id, params, env=nil)
    Request.send('post', uri_path("customers",id.to_s,"subscriptions"), params, env)
  end

  def self.list(params={}, env=nil)
    Request.send('get', uri_path("subscriptions"), params, env)
  end

  def self.subscriptions_for_customer(id, params={}, env=nil)
    Request.send('get', uri_path("customers",id.to_s,"subscriptions"), params, env)
  end

  def self.retrieve(id, env=nil)
    Request.send('get', uri_path("subscriptions",id.to_s), {}, env)
  end

  def self.update(id, params={}, env=nil)
    Request.send('post', uri_path("subscriptions",id.to_s), params, env)
  end

  def self.change_term_end(id, params, env=nil)
    Request.send('post', uri_path("subscriptions",id.to_s,"change_term_end"), params, env)
  end

  def self.cancel(id, params={}, env=nil)
    Request.send('post', uri_path("subscriptions",id.to_s,"cancel"), params, env)
  end

  def self.reactivate(id, params={}, env=nil)
    Request.send('post', uri_path("subscriptions",id.to_s,"reactivate"), params, env)
  end

  def self.add_charge_at_term_end(id, params, env=nil)
    Request.send('post', uri_path("subscriptions",id.to_s,"add_charge_at_term_end"), params, env)
  end

  def self.charge_addon_at_term_end(id, params, env=nil)
    Request.send('post', uri_path("subscriptions",id.to_s,"charge_addon_at_term_end"), params, env)
  end

  def self.add_credit(id, params, env=nil)
    Request.send('post', uri_path("subscriptions",id.to_s,"add_credit"), params, env)
  end

  end # ~Subscription
end # ~ChargeBee