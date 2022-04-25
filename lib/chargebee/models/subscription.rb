module ChargeBee
  class Subscription < Model

    class SubscriptionItem < Model
      attr_accessor :item_price_id, :item_type, :quantity, :quantity_in_decimal, :metered_quantity, :last_calculated_at, :unit_price, :unit_price_in_decimal, :amount, :amount_in_decimal, :free_quantity, :free_quantity_in_decimal, :trial_end, :billing_cycles, :service_period_days, :charge_on_event, :charge_once, :charge_on_option
    end

    class ItemTier < Model
      attr_accessor :item_price_id, :starting_unit, :ending_unit, :price, :starting_unit_in_decimal, :ending_unit_in_decimal, :price_in_decimal
    end

    class ChargedItem < Model
      attr_accessor :item_price_id, :last_charged_at
    end

    class Addon < Model
      attr_accessor :id, :quantity, :unit_price, :amount, :trial_end, :remaining_billing_cycles, :quantity_in_decimal, :unit_price_in_decimal, :amount_in_decimal
    end

    class EventBasedAddon < Model
      attr_accessor :id, :quantity, :unit_price, :service_period_in_days, :on_event, :charge_once, :quantity_in_decimal, :unit_price_in_decimal
    end

    class ChargedEventBasedAddon < Model
      attr_accessor :id, :last_charged_at
    end

    class Coupon < Model
      attr_accessor :coupon_id, :apply_till, :applied_count, :coupon_code
    end

    class ShippingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip, :validation_status
    end

    class ReferralInfo < Model
      attr_accessor :referral_code, :coupon_code, :referrer_id, :external_reference_id, :reward_status, :referral_system, :account_id, :campaign_id, :external_campaign_id, :friend_offer_type, :referrer_reward_type, :notify_referral_system, :destination_url, :post_purchase_widget_enabled
    end

    class ContractTerm < Model
      attr_accessor :id, :status, :contract_start, :contract_end, :billing_cycle, :action_at_term_end, :total_contract_value, :cancellation_cutoff_period, :created_at, :subscription_id, :remaining_billing_cycles
    end

  attr_accessor :id, :currency_code, :plan_id, :plan_quantity, :plan_unit_price, :setup_fee, :billing_period,
  :billing_period_unit, :start_date, :trial_end, :remaining_billing_cycles, :po_number, :auto_collection,
  :plan_quantity_in_decimal, :plan_unit_price_in_decimal, :customer_id, :plan_amount, :plan_free_quantity,
  :status, :trial_start, :trial_end_action, :current_term_start, :current_term_end, :next_billing_at,
  :created_at, :started_at, :activated_at, :gift_id, :contract_term_billing_cycle_on_renewal,
  :override_relationship, :pause_date, :resume_date, :cancelled_at, :cancel_reason, :affiliate_token,
  :created_from_ip, :resource_version, :updated_at, :has_scheduled_advance_invoices, :has_scheduled_changes,
  :payment_source_id, :plan_free_quantity_in_decimal, :plan_amount_in_decimal, :cancel_schedule_created_at,
  :offline_payment_method, :channel, :net_term_days, :subscription_items, :item_tiers, :charged_items,
  :due_invoices_count, :due_since, :total_dues, :mrr, :exchange_rate, :base_currency_code, :addons,
  :event_based_addons, :charged_event_based_addons, :coupon, :coupons, :shipping_address, :referral_info,
  :invoice_notes, :meta_data, :metadata, :deleted, :changes_scheduled_at, :contract_term, :cancel_reason_code,
  :free_period, :free_period_unit, :create_pending_invoices, :auto_close_invoices

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions"), params, env, headers)
  end

  def self.create_for_customer(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"subscriptions"), params, env, headers)
  end

  def self.create_with_items(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"subscription_for_items"), params, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("subscriptions"), params, env, headers)
  end

  def self.subscriptions_for_customer(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("customers",id.to_s,"subscriptions"), params, env, headers)
  end

  def self.contract_terms_for_subscription(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s,"contract_terms"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s), {}, env, headers)
  end

  def self.retrieve_with_scheduled_changes(id, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s,"retrieve_with_scheduled_changes"), {}, env, headers)
  end

  def self.remove_scheduled_changes(id, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"remove_scheduled_changes"), {}, env, headers)
  end

  def self.remove_scheduled_cancellation(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"remove_scheduled_cancellation"), params, env, headers)
  end

  def self.remove_coupons(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"remove_coupons"), params, env, headers)
  end

  def self.update(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s), params, env, headers)
  end

  def self.update_for_items(id, params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"update_for_items"), params, env, headers)
  end

  def self.change_term_end(id, params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"change_term_end"), params, env, headers)
  end

  def self.reactivate(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"reactivate"), params, env, headers)
  end

  def self.add_charge_at_term_end(id, params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"add_charge_at_term_end"), params, env, headers)
  end

  def self.charge_addon_at_term_end(id, params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"charge_addon_at_term_end"), params, env, headers)
  end

  def self.charge_future_renewals(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"charge_future_renewals"), params, env, headers)
  end

  def self.edit_advance_invoice_schedule(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"edit_advance_invoice_schedule"), params, env, headers)
  end

  def self.retrieve_advance_invoice_schedule(id, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s,"retrieve_advance_invoice_schedule"), {}, env, headers)
  end

  def self.remove_advance_invoice_schedule(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"remove_advance_invoice_schedule"), params, env, headers)
  end

  def self.regenerate_invoice(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"regenerate_invoice"), params, env, headers)
  end

  def self.import_subscription(params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions","import_subscription"), params, env, headers)
  end

  def self.import_for_customer(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"import_subscription"), params, env, headers)
  end

  def self.import_contract_term(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"import_contract_term"), params, env, headers)
  end

  def self.import_for_items(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"import_for_items"), params, env, headers)
  end

  def self.override_billing_profile(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"override_billing_profile"), params, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"delete"), {}, env, headers)
  end

  def self.pause(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"pause"), params, env, headers)
  end

  def self.cancel(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"cancel"), params, env, headers)
  end

  def self.cancel_for_items(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"cancel_for_items"), params, env, headers)
  end

  def self.resume(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"resume"), params, env, headers)
  end

  def self.remove_scheduled_pause(id, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"remove_scheduled_pause"), {}, env, headers)
  end

  def self.remove_scheduled_resumption(id, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"remove_scheduled_resumption"), {}, env, headers)
  end

  end # ~Subscription
end # ~ChargeBee