module ChargeBee
  class Subscription < Model

    class Addon < Model
      attr_accessor :id, :quantity
    end

    class Coupon < Model
      attr_accessor :coupon_id, :apply_till, :applied_count, :coupon_code
    end

    class ShippingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip
    end

  attr_accessor :id, :plan_id, :plan_quantity, :status, :start_date, :trial_start, :trial_end,
  :current_term_start, :current_term_end, :remaining_billing_cycles, :po_number, :created_at,
  :started_at, :activated_at, :cancelled_at, :cancel_reason, :affiliate_token, :created_from_ip,
  :due_invoices_count, :due_since, :total_dues, :addons, :coupon, :coupons, :shipping_address,
  :has_scheduled_changes, :invoice_notes

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions"), params, env, headers)
  end

  def self.create_for_customer(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"subscriptions"), params, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send('get', uri_path("subscriptions"), params, env, headers)
  end

  def self.subscriptions_for_customer(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("customers",id.to_s,"subscriptions"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s), {}, env, headers)
  end

  def self.retrieve_with_scheduled_changes(id, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s,"retrieve_with_scheduled_changes"), {}, env, headers)
  end

  def self.remove_scheduled_changes(id, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"remove_scheduled_changes"), {}, env, headers)
  end

  def self.remove_scheduled_cancellation(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"remove_scheduled_cancellation"), params, env, headers)
  end

  def self.update(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s), params, env, headers)
  end

  def self.change_term_end(id, params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"change_term_end"), params, env, headers)
  end

  def self.cancel(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"cancel"), params, env, headers)
  end

  def self.reactivate(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"reactivate"), params, env, headers)
  end

  def self.add_charge_at_term_end(id, params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"add_charge_at_term_end"), params, env, headers)
  end

  def self.charge_addon_at_term_end(id, params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"charge_addon_at_term_end"), params, env, headers)
  end

  end # ~Subscription
end # ~ChargeBee