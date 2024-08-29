module ChargeBee
  class Ramp < Model

    class ItemsToAdd < Model
      attr_accessor :item_price_id, :item_type, :quantity, :quantity_in_decimal, :unit_price, :unit_price_in_decimal, :amount, :amount_in_decimal, :free_quantity, :free_quantity_in_decimal, :billing_cycles, :service_period_days, :metered_quantity
    end

    class ItemsToUpdate < Model
      attr_accessor :item_price_id, :item_type, :quantity, :quantity_in_decimal, :unit_price, :unit_price_in_decimal, :amount, :amount_in_decimal, :free_quantity, :free_quantity_in_decimal, :billing_cycles, :service_period_days, :metered_quantity
    end

    class CouponsToAdd < Model
      attr_accessor :coupon_id, :apply_till
    end

    class DiscountsToAdd < Model
      attr_accessor :id, :invoice_name, :type, :percentage, :amount, :duration_type, :period, :period_unit, :included_in_mrr, :apply_on, :item_price_id, :created_at
    end

    class ItemTier < Model
      attr_accessor :item_price_id, :starting_unit, :ending_unit, :price, :starting_unit_in_decimal, :ending_unit_in_decimal, :price_in_decimal, :index
    end

    class StatusTransitionReason < Model
      attr_accessor :code, :message
    end

  attr_accessor :id, :description, :subscription_id, :effective_from, :status, :created_at, :resource_version,
  :updated_at, :items_to_add, :items_to_update, :coupons_to_add, :discounts_to_add, :item_tiers,
  :items_to_remove, :coupons_to_remove, :discounts_to_remove, :deleted, :status_transition_reason

  # OPERATIONS
  #-----------

  def self.create_for_subscription(id, params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"create_ramp"), params, env, headers)
  end

  def self.update(id, params, env=nil, headers={})
    Request.send('post', uri_path("ramps",id.to_s,"update"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("ramps",id.to_s), {}, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("ramps",id.to_s,"delete"), {}, env, headers)
  end

  def self.list(params, env=nil, headers={})
    Request.send_list_request('get', uri_path("ramps"), params, env, headers)
  end

  end # ~Ramp
end # ~ChargeBee