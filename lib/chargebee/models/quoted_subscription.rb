module ChargeBee
  class QuotedSubscription < Model

    class Addon < Model
      attr_accessor :id, :quantity, :unit_price, :amount, :trial_end, :remaining_billing_cycles, :quantity_in_decimal, :unit_price_in_decimal, :amount_in_decimal
    end

    class EventBasedAddon < Model
      attr_accessor :id, :quantity, :unit_price, :service_period_in_days, :on_event, :charge_once, :quantity_in_decimal, :unit_price_in_decimal
    end

    class Coupon < Model
      attr_accessor :coupon_id, :apply_till, :applied_count, :coupon_code
    end

    class SubscriptionItem < Model
      attr_accessor :item_price_id, :item_type, :quantity, :unit_price, :amount, :free_quantity, :trial_end, :billing_cycles, :service_period_days, :charge_on_event, :charge_once, :charge_on_option
    end

    class ItemTier < Model
      attr_accessor :item_price_id, :starting_unit, :ending_unit, :price
    end

  attr_accessor :id, :plan_id, :plan_quantity, :plan_unit_price, :setup_fee, :billing_period,
  :billing_period_unit, :start_date, :trial_end, :remaining_billing_cycles, :po_number, :auto_collection,
  :addons, :event_based_addons, :coupons, :subscription_items, :item_tiers

  # OPERATIONS
  #-----------

  end # ~QuotedSubscription
end # ~ChargeBee