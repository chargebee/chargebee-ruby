module ChargeBee
  class Coupon < Model

  attr_accessor :id, :name, :invoice_name, :discount_type, :discount_percentage, :discount_amount,
  :discount_quantity, :duration_type, :duration_month, :valid_till, :max_redemptions, :status,
  :apply_discount_on, :apply_on, :plan_constraint, :addon_constraint, :created_at, :archived_at,
  :plan_ids, :addon_ids, :redemptions, :invoice_notes

  # OPERATIONS
  #-----------

  def self.create(params, env=nil)
    Request.send('post', uri_path("coupons"), params, env)
  end

  def self.list(params={}, env=nil)
    Request.send('get', uri_path("coupons"), params, env)
  end

  def self.retrieve(id, env=nil)
    Request.send('get', uri_path("coupons",id.to_s), {}, env)
  end

  end # ~Coupon
end # ~ChargeBee