module ChargeBee
  class Transaction < Model

    class LinkedInvoice < Model
      attr_accessor :invoice_id, :applied_amount, :applied_at, :invoice_date, :invoice_total, :invoice_status
    end

    class LinkedCreditNote < Model
      attr_accessor :cn_id, :applied_amount, :applied_at, :cn_reason_code, :cn_create_reason_code, :cn_date, :cn_total, :cn_status, :cn_reference_invoice_id
    end

    class LinkedRefund < Model
      attr_accessor :txn_id, :txn_status, :txn_date, :txn_amount
    end

    class LinkedPayment < Model
      attr_accessor :id, :status, :amount, :date
    end

  attr_accessor :id, :customer_id, :subscription_id, :gateway_account_id, :payment_source_id,
  :payment_method, :reference_number, :gateway, :type, :date, :settled_at, :exchange_rate, :currency_code,
  :amount, :id_at_gateway, :status, :fraud_flag, :initiator_type, :three_d_secure, :authorization_reason,
  :error_code, :error_text, :voided_at, :resource_version, :updated_at, :fraud_reason, :amount_unused,
  :masked_card_number, :reference_transaction_id, :refunded_txn_id, :reference_authorization_id,
  :amount_capturable, :reversal_transaction_id, :linked_invoices, :linked_credit_notes, :linked_refunds,
  :linked_payments, :deleted, :iin, :last4, :merchant_reference_id

  # OPERATIONS
  #-----------

  def self.create_authorization(params, env=nil, headers={})
    Request.send('post', uri_path("transactions","create_authorization"), params, env, headers)
  end

  def self.void_transaction(id, env=nil, headers={})
    Request.send('post', uri_path("transactions",id.to_s,"void"), {}, env, headers)
  end

  def self.record_refund(id, params, env=nil, headers={})
    Request.send('post', uri_path("transactions",id.to_s,"record_refund"), params, env, headers)
  end

  def self.refund(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("transactions",id.to_s,"refund"), params, env, headers)
  end

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

  def self.delete_offline_transaction(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("transactions",id.to_s,"delete_offline_transaction"), params, env, headers)
  end

  end # ~Transaction
end # ~ChargeBee