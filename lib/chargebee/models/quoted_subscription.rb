module ChargeBee
  class QuotedSubscription < Model

    class Addon < Model
      attr_accessor :id, :quantity, :unit_price, :amount, :trial_end, :remaining_billing_cycles
    end

    class EventBasedAddon < Model
      attr_accessor :id, :quantity, :unit_price, :service_period_in_days, :on_event, :charge_once
    end

    class Coupon < Model
      attr_accessor :coupon_id, :apply_till, :applied_count, :coupon_code
    end

  attr_accessor :id, :plan_id, :plan_quantity, :plan_unit_price, :setup_fee, :billing_period,
  :billing_period_unit, :start_date, :trial_end, :remaining_billing_cycles, :po_number, :auto_collection,
  :addons, :event_based_addons, :coupons

  # OPERATIONS
  #-----------

  end # ~QuotedSubscription
end # ~ChargeBee