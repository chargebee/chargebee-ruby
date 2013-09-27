module ChargeBee
  class CouponCode < Model

  attr_accessor :code, :coupon_id, :coupon_set_name

  # OPERATIONS
  #-----------
    
  def self.create(params, env=nil)
    Request.send('post', "/coupon_codes", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/coupon_codes/#{id.to_s}", {}, env)
  end    

  end # ~CouponCode
end # ~ChargeBee    