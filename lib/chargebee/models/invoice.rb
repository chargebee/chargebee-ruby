module ChargeBee
  class Invoice < Model

    class LineItem < Model
      attr_accessor :date_from, :date_to, :unit_amount, :quantity, :tax, :tax_rate, :amount, :description, :type, :entity_type, :entity_id
    end

    class Discount < Model
      attr_accessor :amount, :description, :type, :entity_id
    end

    class Tax < Model
      attr_accessor :amount, :description
    end

    class LinkedTransaction < Model
      attr_accessor :txn_id, :applied_amount, :txn_type, :txn_status, :txn_date, :txn_amount
    end

    class LinkedOrder < Model
      attr_accessor :id, :status, :reference_id, :fulfillment_status, :batch_id, :created_at
    end

    class Note < Model
      attr_accessor :entity_type, :note, :entity_id
    end

    class ShippingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip
    end

    class BillingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip
    end

  attr_accessor :id, :po_number, :customer_id, :subscription_id, :recurring, :status, :vat_number,
  :start_date, :end_date, :amount, :amount_due, :paid_on, :dunning_status, :next_retry, :sub_total,
  :tax, :first_invoice, :currency_code, :line_items, :discounts, :taxes, :linked_transactions,
  :linked_orders, :notes, :shipping_address, :billing_address

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
    Request.send('get', uri_path("invoices"), params, env, headers)
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

  def self.collect(id, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"collect"), {}, env, headers)
  end

  def self.collect_payment(id, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"collect_payment"), {}, env, headers)
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

  def self.delete(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"delete"), params, env, headers)
  end

  end # ~Invoice
end # ~ChargeBee