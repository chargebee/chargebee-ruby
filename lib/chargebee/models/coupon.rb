module ChargeBee
  class Coupon < Model

    class ItemConstraint < Model
      attr_accessor :item_type, :constraint, :item_price_ids
    end

    class ItemConstraintCriteria < Model
      attr_accessor :item_type, :currencies, :item_family_ids, :item_price_periods
    end

  attr_accessor :id, :name, :invoice_name, :discount_type, :discount_percentage, :discount_amount,
  :discount_quantity, :currency_code, :duration_type, :duration_month, :valid_till, :max_redemptions,
  :status, :apply_discount_on, :apply_on, :plan_constraint, :addon_constraint, :created_at, :archived_at,
  :resource_version, :updated_at, :included_in_mrr, :period, :period_unit, :plan_ids, :addon_ids,
  :item_constraints, :item_constraint_criteria, :redemptions, :invoice_notes, :meta_data

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("coupons"), params, env, headers)
  end

  def self.create_for_items(params, env=nil, headers={})
    Request.send('post', uri_path("coupons","create_for_items"), params, env, headers)
  end

  def self.update_for_items(id, params, env=nil, headers={})
    Request.send('post', uri_path("coupons",id.to_s,"update_for_items"), params, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("coupons"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("coupons",id.to_s), {}, env, headers)
  end

  def self.update(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("coupons",id.to_s), params, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("coupons",id.to_s,"delete"), {}, env, headers)
  end

  def self.copy(params, env=nil, headers={})
    Request.send('post', uri_path("coupons","copy"), params, env, headers)
  end

  def self.unarchive(id, env=nil, headers={})
    Request.send('post', uri_path("coupons",id.to_s,"unarchive"), {}, env, headers)
  end

  end # ~Coupon
end # ~ChargeBee