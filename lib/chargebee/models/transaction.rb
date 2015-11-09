module ChargeBee
  class Transaction < Model

    class LinkedInvoice < Model
      attr_accessor :invoice_id, :applied_amount, :applied_at, :invoice_date, :invoice_amount
    end

    class LinkedRefund < Model
      attr_accessor :txn_amount, :txn_date, :txn_id, :txn_status
    end

  attr_accessor :id, :customer_id, :subscription_id, :payment_method, :reference_number, :gateway,
  :description, :type, :date, :amount, :id_at_gateway, :status, :error_code, :error_text, :voided_at,
  :void_description, :amount_unused, :masked_card_number, :reference_transaction_id, :refunded_txn_id,
  :reversal_transaction_id, :linked_invoices, :linked_refunds, :currency_code

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