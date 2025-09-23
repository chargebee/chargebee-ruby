module ChargeBee
  class Ramp < Model

    class ItemsToAdd < Model
      attr_accessor :item_price_id, :item_type, :quantity, :quantity_in_decimal, :unit_price, :unit_price_in_decimal, :amount, :amount_in_decimal, :free_quantity, :free_quantity_in_decimal, :billing_cycles, :service_period_days, :metered_quantity, :charge_once, :charge_on_option, :charge_on_event
    end

    class ItemsToUpdate < Model
      attr_accessor :item_price_id, :item_type, :quantity, :quantity_in_decimal, :unit_price, :unit_price_in_decimal, :amount, :amount_in_decimal, :free_quantity, :free_quantity_in_decimal, :billing_cycles, :service_period_days, :metered_quantity, :charge_once, :charge_on_option, :charge_on_event
    end

    class CouponsToAdd < Model
      attr_accessor :coupon_id, :apply_till
    end

    class DiscountsToAdd < Model
      attr_accessor :id, :invoice_name, :type, :percentage, :amount, :duration_type, :period, :period_unit, :included_in_mrr, :apply_on, :item_price_id, :created_at
    end

    class ItemTier < Model
      attr_accessor :item_price_id, :starting_unit, :ending_unit, :price, :starting_unit_in_decimal, :ending_unit_in_decimal, :price_in_decimal, :pricing_type, :package_size, :index
    end

    class ContractTerm < Model
      attr_accessor :cancellation_cutoff_period, :renewal_billing_cycles, :action_at_term_end
    end

    class StatusTransitionReason < Model
      attr_accessor :code, :message
    end

  attr_accessor :id, :description, :subscription_id, :effective_from, :status, :created_at, :resource_version,
  :updated_at, :items_to_add, :items_to_update, :coupons_to_add, :discounts_to_add, :item_tiers,
  :items_to_remove, :coupons_to_remove, :discounts_to_remove, :contract_term, :deleted, :status_transition_reason

  # OPERATIONS
  #-----------

  def self.create_for_subscription(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("subscriptions",id.to_s,"create_ramp"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.update(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("ramps",id.to_s,"update"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("ramps",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("ramps",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.list(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("ramps"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~Ramp
end # ~ChargeBee