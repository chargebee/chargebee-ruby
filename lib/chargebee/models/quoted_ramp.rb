module ChargeBee
  class QuotedRamp < Model

    class LineItem < Model
      attr_accessor :item_price_id, :item_type, :quantity, :quantity_in_decimal, :metered_quantity, :unit_price, :unit_price_in_decimal, :amount, :amount_in_decimal, :billing_period, :billing_period_unit, :free_quantity, :free_quantity_in_decimal, :billing_cycles, :service_period_days, :charge_on_event, :charge_once, :charge_on_option, :start_date, :end_date, :ramp_tier_id, :discount_per_billing_cycle, :discount_per_billing_cycle_in_decimal, :item_level_discount_per_billing_cycle, :item_level_discount_per_billing_cycle_in_decimal, :amount_per_billing_cycle, :amount_per_billing_cycle_in_decimal, :net_amount_per_billing_cycle, :net_amount_per_billing_cycle_in_decimal
    end

    class Discount < Model
      attr_accessor :id, :invoice_name, :type, :percentage, :amount, :duration_type, :entity_type, :entity_id, :period, :period_unit, :included_in_mrr, :apply_on, :item_price_id, :created_at, :updated_at, :start_date, :end_date
    end

    class ItemTier < Model
      attr_accessor :item_price_id, :starting_unit, :ending_unit, :price, :starting_unit_in_decimal, :ending_unit_in_decimal, :price_in_decimal, :ramp_tier_id, :pricing_type, :package_size
    end

    class CouponApplicabilityMapping < Model
      attr_accessor :coupon_id, :applicable_item_price_ids
    end

  attr_accessor :id, :line_items, :discounts, :item_tiers, :coupon_applicability_mappings

  # OPERATIONS
  #-----------

  end # ~QuotedRamp
end # ~ChargeBee