module ChargeBee
  class Transaction < Model

    class LinkedInvoice < Model
      attr_accessor :invoice_id, :applied_amount, :applied_at, :invoice_date, :invoice_total, :invoice_status
    end

    class LinkedCreditNote < Model
      attr_accessor :cn_id, :applied_amount, :applied_at, :cn_reason_code, :cn_date, :cn_total, :cn_status, :cn_reference_invoice_id
    end

    class LinkedRefund < Model
      attr_accessor :txn_id, :txn_status, :txn_date, :txn_amount
    end

  attr_accessor :id, :customer_id, :subscription_id, :payment_method, :reference_number, :gateway,
  :type, :date, :currency_code, :amount, :id_at_gateway, :status, :error_code, :error_text, :voided_at,
  :amount_unused, :masked_card_number, :reference_transaction_id, :refunded_txn_id, :reversal_transaction_id,
  :linked_invoices, :linked_credit_notes, :linked_refunds

  # OPERATIONS
  #-----------

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("transactions"), params, env, headers)
  end

  def self.transactions_for_customer(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("customers",id.to_s,"transactions"), params, env, headers)
  end

  def self.transactions_for_subscription(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s,"transactions"), params, env, headers)
  end

  def self.payments_for_invoice(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("invoices",id.to_s,"payments"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("transactions",id.to_s), {}, env, headers)
  end

  end # ~Transaction
end # ~ChargeBee