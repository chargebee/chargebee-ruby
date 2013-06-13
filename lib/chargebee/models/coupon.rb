module ChargeBee
  class Coupon < Model

  attr_accessor :id, :name, :invoice_name, :discount_type, :discount_percentage, :discount_amount,
  :discount_quantity, :duration_type, :duration_month, :max_redemptions, :status, :redemptions,
  :apply_discount_on, :apply_on, :created_at, :archived_at, :valid_till

  # OPERATIONS
  #-----------
    
  def self.list(params={}, env=nil)
    Request.send('get', "/coupons", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/coupons/#{id.to_s}", {}, env)
  end    

  end # ~Coupon
end # ~ChargeBee    