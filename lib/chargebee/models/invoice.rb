module ChargeBee
  class Invoice < Model

    class LineItem < Model
      attr_accessor :id, :subscription_id, :date_from, :date_to, :unit_amount, :quantity, :amount, :pricing_model, :is_taxed, :tax_amount, :tax_rate, :unit_amount_in_decimal, :quantity_in_decimal, :amount_in_decimal, :discount_amount, :item_level_discount_amount, :description, :entity_description, :entity_type, :tax_exempt_reason, :entity_id, :customer_id
    end

    class Discount < Model
      attr_accessor :amount, :description, :entity_type, :entity_id
    end

    class LineItemDiscount < Model
      attr_accessor :line_item_id, :discount_type, :coupon_id, :entity_id, :discount_amount
    end

    class Tax < Model
      attr_accessor :name, :amount, :description
    end

    class LineItemTax < Model
      attr_accessor :line_item_id, :tax_name, :tax_rate, :is_partial_tax_applied, :is_non_compliance_tax, :taxable_amount, :tax_amount, :tax_juris_type, :tax_juris_name, :tax_juris_code, :tax_amount_in_local_currency, :local_currency_code
    end

    class LineItemTier < Model
      attr_accessor :line_item_id, :starting_unit, :ending_unit, :quantity_used, :unit_amount, :starting_unit_in_decimal, :ending_unit_in_decimal, :quantity_used_in_decimal, :unit_amount_in_decimal
    end

    class LinkedPayment < Model
      attr_accessor :txn_id, :applied_amount, :applied_at, :txn_status, :txn_date, :txn_amount
    end

    class DunningAttempt < Model
      attr_accessor :attempt, :transaction_id, :dunning_type, :created_at, :txn_status, :txn_amount
    end

    class AppliedCredit < Model
      attr_accessor :cn_id, :applied_amount, :applied_at, :cn_reason_code, :cn_create_reason_code, :cn_date, :cn_status
    end

    class AdjustmentCreditNote < Model
      attr_accessor :cn_id, :cn_reason_code, :cn_create_reason_code, :cn_date, :cn_total, :cn_status
    end

    class IssuedCreditNote < Model
      attr_accessor :cn_id, :cn_reason_code, :cn_create_reason_code, :cn_date, :cn_total, :cn_status
    end

    class LinkedOrder < Model
      attr_accessor :id, :document_number, :status, :order_type, :reference_id, :fulfillment_status, :batch_id, :created_at
    end

    class Note < Model
      attr_accessor :entity_type, :note, :entity_id
    end

    class ShippingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip, :validation_status
    end

    class BillingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip, :validation_status
    end

    class Einvoice < Model
      attr_accessor :id, :status, :message
    end

  attr_accessor :id, :po_number, :customer_id, :subscription_id, :recurring, :status, :vat_number,
  :price_type, :date, :due_date, :net_term_days, :exchange_rate, :currency_code, :total, :amount_paid,
  :amount_adjusted, :write_off_amount, :credits_applied, :amount_due, :paid_at, :dunning_status,
  :next_retry_at, :voided_at, :resource_version, :updated_at, :sub_total, :sub_total_in_local_currency,
  :total_in_local_currency, :local_currency_code, :tax, :first_invoice, :new_sales_amount, :has_advance_charges,
  :term_finalized, :is_gifted, :generated_at, :expected_payment_date, :amount_to_collect, :round_off_amount,
  :line_items, :discounts, :line_item_discounts, :taxes, :line_item_taxes, :line_item_tiers, :linked_payments,
  :dunning_attempts, :applied_credits, :adjustment_credit_notes, :issued_credit_notes, :linked_orders,
  :notes, :shipping_address, :billing_address, :einvoice, :payment_owner, :void_reason_code, :deleted,
  :vat_number_prefix, :channel

  # OPERATIONS
  #-----------

  def self.create(params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices"), params, env, headers)
  end

  def self.create_for_charge_items_and_charges(params, env=nil, headers={})
    Request.send('post', uri_path("invoices","create_for_charge_items_and_charges"), params, env, headers)
  end

  def self.charge(params, env=nil, headers={})
    Request.send('post', uri_path("invoices","charge"), params, env, headers)
  end

  def self.charge_addon(params, env=nil, headers={})
    Request.send('post', uri_path("invoices","charge_addon"), params, env, headers)
  end

  def self.create_for_charge_item(params, env=nil, headers={})
    Request.send('post', uri_path("invoices","create_for_charge_item"), params, env, headers)
  end

  def self.stop_dunning(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"stop_dunning"), params, env, headers)
  end

  def self.import_invoice(params, env=nil, headers={})
    Request.send('post', uri_path("invoices","import_invoice"), params, env, headers)
  end

  def self.apply_payments(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"apply_payments"), params, env, headers)
  end

  def self.sync_usages(id, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"sync_usages"), {}, env, headers)
  end

  def self.apply_credits(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"apply_credits"), params, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("invoices"), params, env, headers)
  end

  def self.invoices_for_customer(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("customers",id.to_s,"invoices"), params, env, headers)
  end

  def self.invoices_for_subscription(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s,"invoices"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("invoices",id.to_s), {}, env, headers)
  end

  def self.pdf(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"pdf"), params, env, headers)
  end

  def self.download_einvoice(id, env=nil, headers={})
    Request.send('get', uri_path("invoices",id.to_s,"download_einvoice"), {}, env, headers)
  end

  def self.add_charge(id, params, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"add_charge"), params, env, headers)
  end

  def self.add_addon_charge(id, params, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"add_addon_charge"), params, env, headers)
  end

  def self.add_charge_item(id, params, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"add_charge_item"), params, env, headers)
  end

  def self.close(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"close"), params, env, headers)
  end

  def self.collect_payment(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"collect_payment"), params, env, headers)
  end

  def self.record_payment(id, params, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"record_payment"), params, env, headers)
  end

  def self.refund(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"refund"), params, env, headers)
  end

  def self.record_refund(id, params, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"record_refund"), params, env, headers)
  end

  def self.remove_payment(id, params, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"remove_payment"), params, env, headers)
  end

  def self.remove_credit_note(id, params, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"remove_credit_note"), params, env, headers)
  end

  def self.void_invoice(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"void"), params, env, headers)
  end

  def self.write_off(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"write_off"), params, env, headers)
  end

  def self.delete(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"delete"), params, env, headers)
  end

  def self.update_details(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"update_details"), params, env, headers)
  end

  def self.resend_einvoice(id, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"resend_einvoice"), {}, env, headers)
  end

  end # ~Invoice
end # ~ChargeBee