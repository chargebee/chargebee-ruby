module ChargeBee
  class PaymentVoucher < Model

    class LinkedInvoice < Model
      attr_accessor :invoice_id, :txn_id, :applied_at
    end

  attr_accessor :id, :id_at_gateway, :payment_voucher_type, :expires_at, :status, :subscription_id,
  :currency_code, :amount, :gateway_account_id, :payment_source_id, :gateway, :payload, :error_code,
  :error_text, :url, :date, :resource_version, :updated_at, :customer_id, :linked_invoices

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("payment_vouchers"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("payment_vouchers",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.payment_vouchers_for_invoice(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("invoices",id.to_s,"payment_vouchers"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.payment_vouchers_for_customer(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("customers",id.to_s,"payment_vouchers"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~PaymentVoucher
end # ~ChargeBee