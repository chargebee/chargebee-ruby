module ChargeBee
  class QuotedSubscription < Model

    class Addon < Model
      attr_accessor :id, :quantity, :unit_price, :amount, :trial_end, :remaining_billing_cycles, :quantity_in_decimal, :unit_price_in_decimal, :amount_in_decimal, :proration_type
    end

    class EventBasedAddon < Model
      attr_accessor :id, :quantity, :unit_price, :service_period_in_days, :on_event, :charge_once, :quantity_in_decimal, :unit_price_in_decimal
    end

    class Coupon < Model
      attr_accessor :coupon_id
    end

    class SubscriptionItem < Model
      attr_accessor :item_price_id, :item_type, :quantity, :quantity_in_decimal, :metered_quantity, :last_calculated_at, :unit_price, :unit_price_in_decimal, :amount, :current_term_start, :current_term_end, :next_billing_at, :amount_in_decimal, :billing_period, :billing_period_unit, :free_quantity, :free_quantity_in_decimal, :trial_end, :billing_cycles, :service_period_days, :charge_on_event, :charge_once, :charge_on_option, :proration_type, :usage_accumulation_reset_frequency
    end

    class ItemTier < Model
      attr_accessor :item_price_id, :starting_unit, :ending_unit, :price, :starting_unit_in_decimal, :ending_unit_in_decimal, :price_in_decimal, :pricing_type, :package_size, :index
    end

    class QuotedContractTerm < Model
      attr_accessor :contract_start, :contract_end, :billing_cycle, :action_at_term_end, :total_contract_value, :cancellation_cutoff_period
    end

  attr_accessor :id, :plan_id, :plan_quantity, :plan_unit_price, :setup_fee, :billing_period,
  :billing_period_unit, :start_date, :trial_end, :remaining_billing_cycles, :po_number, :auto_collection,
  :plan_quantity_in_decimal, :plan_unit_price_in_decimal, :changes_scheduled_at, :change_option,
  :contract_term_billing_cycle_on_renewal, :addons, :event_based_addons, :coupons, :subscription_items,
  :item_tiers, :quoted_contract_term

  # OPERATIONS
  #-----------

  end # ~QuotedSubscription
end # ~ChargeBee