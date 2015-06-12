module ChargeBee
  class Transaction < Model

    class LinkedInvoice < Model
      attr_accessor :invoice_id, :applied_amount, :invoice_date, :invoice_amount
    end

  attr_accessor :id, :customer_id, :subscription_id, :payment_method, :reference_number, :gateway,
  :description, :type, :date, :amount, :id_at_gateway, :status, :error_code, :error_text, :voided_at,
  :void_description, :masked_card_number, :refunded_txn_id, :linked_invoices

  # OPERATIONS
  #-----------

  def self.list(params={}, env=nil, headers={})
    Request.send('get', uri_path("transactions"), params, env, headers)
  end

  def self.transactions_for_customer(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("customers",id.to_s,"transactions"), params, env, headers)
  end

  def self.transactions_for_subscription(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s,"transactions"), params, env, headers)
  end

  def self.transactions_for_invoice(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("invoices",id.to_s,"transactions"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("transactions",id.to_s), {}, env, headers)
  end

  def self.record_payment(id, params, env=nil, headers={})
    Request.send('post', uri_path("invoices",id.to_s,"record_payment"), params, env, headers)
  end

  end # ~Transaction
end # ~ChargeBee