module ChargeBee
  class Coupon < Model

    class ItemConstraint < Model
      attr_accessor :item_type, :constraint, :item_price_ids
    end

    class ItemConstraintCriteria < Model
      attr_accessor :item_type, :currencies, :item_family_ids, :item_price_periods
    end

    class CouponConstraint < Model
      attr_accessor :entity_type, :type, :value
    end

  attr_accessor :id, :name, :invoice_name, :discount_type, :discount_percentage, :discount_amount,
  :discount_quantity, :currency_code, :duration_type, :duration_month, :valid_from, :valid_till,
  :max_redemptions, :status, :apply_discount_on, :apply_on, :plan_constraint, :addon_constraint,
  :created_at, :archived_at, :resource_version, :updated_at, :included_in_mrr, :period, :period_unit,
  :plan_ids, :addon_ids, :item_constraints, :item_constraint_criteria, :redemptions, :invoice_notes,
  :meta_data, :coupon_constraints, :deleted

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
        :meta_data => 0,
    }
    Request.send('post', uri_path("coupons"), params, env, headers,nil, false, jsonKeys)
  end

  def self.create_for_items(params, env=nil, headers={})
    jsonKeys = { 
        :meta_data => 0,
        :item_price_ids => 1,
        :item_family_ids => 1,
        :currencies => 1,
        :item_price_periods => 1,
    }
    Request.send('post', uri_path("coupons","create_for_items"), params, env, headers,nil, false, jsonKeys)
  end

  def self.update_for_items(id, params, env=nil, headers={})
    jsonKeys = { 
        :meta_data => 0,
        :item_price_ids => 1,
        :item_family_ids => 1,
        :currencies => 1,
        :item_price_periods => 1,
    }
    Request.send('post', uri_path("coupons",id.to_s,"update_for_items"), params, env, headers,nil, false, jsonKeys)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send_list_request('get', uri_path("coupons"), params, env, headers,nil, false, jsonKeys)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('get', uri_path("coupons",id.to_s), {}, env, headers,nil, false, jsonKeys)
  end

  def self.update(id, params={}, env=nil, headers={})
    jsonKeys = { 
        :meta_data => 0,
    }
    Request.send('post', uri_path("coupons",id.to_s), params, env, headers,nil, false, jsonKeys)
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("coupons",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys)
  end

  def self.copy(params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("coupons","copy"), params, env, headers,nil, false, jsonKeys)
  end

  def self.unarchive(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("coupons",id.to_s,"unarchive"), {}, env, headers,nil, false, jsonKeys)
  end

  end # ~Coupon
end # ~ChargeBee