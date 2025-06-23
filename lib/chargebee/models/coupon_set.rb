module ChargeBee
  class CouponSet < Model

  attr_accessor :id, :coupon_id, :name, :total_count, :redeemed_count, :archived_count, :meta_data

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
        :meta_data => 0,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("coupon_sets"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.add_coupon_codes(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("coupon_sets",id.to_s,"add_coupon_codes"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("coupon_sets"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("coupon_sets",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.update(id, params={}, env=nil, headers={})
    jsonKeys = { 
        :meta_data => 0,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("coupon_sets",id.to_s,"update"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("coupon_sets",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.delete_unused_coupon_codes(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("coupon_sets",id.to_s,"delete_unused_coupon_codes"), {}, env, headers,nil, false, jsonKeys, options)
  end

  end # ~CouponSet
end # ~ChargeBee