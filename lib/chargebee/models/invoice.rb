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

    class ShippingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip
    end

    class BillingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip
    end

  attr_accessor :id, :customer_id, :subscription_id, :recurring, :status, :vat_number, :start_date,
  :end_date, :amount, :paid_on, :next_retry, :sub_total, :tax, :line_items, :discounts, :taxes,
  :linked_transactions, :linked_orders, :shipping_address, :billing_address

  # OPERATIONS
  #-----------

  def self.create(params, env=nil)
    Request.send('post', uri_path("invoices"), params, env)
  end

  def self.charge(params, env=nil)
    Request.send('post', uri_path("invoices","charge"), params, env)
  end

  def self.charge_addon(params, env=nil)
    Request.send('post', uri_path("invoices","charge_addon"), params, env)
  end

  def self.list(params={}, env=nil)
    Request.send('get', uri_path("invoices"), params, env)
  end

  def self.invoices_for_customer(id, params={}, env=nil)
    Request.send('get', uri_path("customers",id.to_s,"invoices"), params, env)
  end

  def self.invoices_for_subscription(id, params={}, env=nil)
    Request.send('get', uri_path("subscriptions",id.to_s,"invoices"), params, env)
  end

  def self.retrieve(id, env=nil)
    Request.send('get', uri_path("invoices",id.to_s), {}, env)
  end

  def self.pdf(id, env=nil)
    Request.send('post', uri_path("invoices",id.to_s,"pdf"), {}, env)
  end

  def self.add_charge(id, params, env=nil)
    Request.send('post', uri_path("invoices",id.to_s,"add_charge"), params, env)
  end

  def self.add_addon_charge(id, params, env=nil)
    Request.send('post', uri_path("invoices",id.to_s,"add_addon_charge"), params, env)
  end

  def self.collect(id, env=nil)
    Request.send('post', uri_path("invoices",id.to_s,"collect"), {}, env)
  end

  def self.refund(id, params={}, env=nil)
    Request.send('post', uri_path("invoices",id.to_s,"refund"), params, env)
  end

  end # ~Invoice
end # ~ChargeBee