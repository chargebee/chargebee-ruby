module ChargeBee
  class Invoice < Model

    class LineItem < Model
      attr_accessor :id, :date_from, :date_to, :unit_amount, :quantity, :is_taxed, :tax_amount, :tax_rate, :amount, :discount_amount, :item_level_discount_amount, :description, :entity_type, :entity_id
    end

    class Discount < Model
      attr_accessor :amount, :description, :entity_type, :entity_id
    end

    class Tax < Model
      attr_accessor :name, :amount, :description
    end

    class LineItemTax < Model
      attr_accessor :line_item_id, :tax_name, :tax_rate, :tax_amount, :tax_juris_type, :tax_juris_name, :tax_juris_code
    end

    class LinkedPayment < Model
      attr_accessor :txn_id, :applied_amount, :applied_at, :txn_status, :txn_date, :txn_amount
    end

    class AppliedCredit < Model
      attr_accessor :cn_id, :applied_amount, :applied_at, :cn_reason_code, :cn_date, :cn_status
    end

    class AdjustmentCreditNote < Model
      attr_accessor :cn_id, :cn_reason_code, :cn_date, :cn_total, :cn_status
    end

    class IssuedCreditNote < Model
      attr_accessor :cn_id, :cn_reason_code, :cn_date, :cn_total, :cn_status
    end

    class LinkedOrder < Model
      attr_accessor :id, :status, :reference_id, :fulfillment_status, :batch_id, :created_at
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

  attr_accessor :id, :po_number, :customer_id, :subscription_id, :recurring, :status, :vat_number,
  :price_type, :date, :currency_code, :total, :amount_paid, :amount_adjusted, :write_off_amount,
  :credits_applied, :amount_due, :paid_at, :dunning_status, :next_retry_at, :sub_total, :tax,
  :first_invoice, :line_items, :discounts, :taxes, :line_item_taxes, :linked_payments, :applied_credits,
  :adjustment_credit_notes, :issued_credit_notes, :linked_orders, :notes, :shipping_address, :billing_address

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("invoices"), params, env, headers)
  end

  def self.charge(params, env=nil, headers={})
    Request.send('post', uri_path("invoices","charge"), params, env, headers)
  end

  def self.charge_addon(params, env=nil, headers={})
    Request.send('post', uri_path("invoices","charge_addon"), params, env, headers)
  end

  def self.stop_dunning(id, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"stop_dunning"), {}, env, headers)
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

  def self.pdf(id, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"pdf"), {}, env, headers)
  end

  def self.add_charge(id, params, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"add_charge"), params, env, headers)
  end

  def self.add_addon_charge(id, params, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"add_addon_charge"), params, env, headers)
  end

  def self.close(id, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"close"), {}, env, headers)
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

  def self.void_invoice(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"void"), params, env, headers)
  end

  def self.write_off(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"write_off"), params, env, headers)
  end

  def self.delete(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"delete"), params, env, headers)
  end

  end # ~Invoice
end # ~ChargeBee