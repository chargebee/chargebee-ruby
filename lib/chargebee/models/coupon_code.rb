module ChargeBee
  class CouponCode < Model

  attr_accessor :code, :status, :coupon_id, :coupon_set_id, :coupon_set_name

  # OPERATIONS
  #-----------

  # @deprecated This method is deprecated and will be removed in a future version.
  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("coupon_codes"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("coupon_codes",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("coupon_codes"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.archive(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("coupon_codes",id.to_s,"archive"), {}, env, headers,nil, false, jsonKeys, options)
  end

  end # ~CouponCode
end # ~ChargeBee