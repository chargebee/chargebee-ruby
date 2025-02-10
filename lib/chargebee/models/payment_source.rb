module ChargeBee
  class PaymentSource < Model

    class Card < Model
      attr_accessor :first_name, :last_name, :iin, :last4, :brand, :funding_type, :expiry_month, :expiry_year, :billing_addr1, :billing_addr2, :billing_city, :billing_state_code, :billing_state, :billing_country, :billing_zip, :masked_number
    end

    class BankAccount < Model
      attr_accessor :last4, :name_on_account, :first_name, :last_name, :direct_debit_scheme, :bank_name, :mandate_id, :account_type, :echeck_type, :account_holder_type, :email
    end

    class CustVoucherSource < Model
      attr_accessor :last4, :first_name, :last_name, :email
    end

    class BillingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip, :validation_status
    end

    class AmazonPayment < Model
      attr_accessor :email, :agreement_id
    end

    class Upi < Model
      attr_accessor :vpa
    end

    class Paypal < Model
      attr_accessor :email, :agreement_id
    end

    class Venmo < Model
      attr_accessor :user_name
    end

    class KlarnaPayNow < Model
      attr_accessor :email
    end

    class Mandate < Model
      attr_accessor :id, :subscription_id, :created_at
    end

  attr_accessor :id, :resource_version, :updated_at, :created_at, :customer_id, :type, :reference_id,
  :status, :gateway, :gateway_account_id, :ip_address, :issuing_country, :card, :bank_account,
  :boleto, :billing_address, :amazon_payment, :upi, :paypal, :venmo, :klarna_pay_now, :mandates,
  :deleted, :business_entity_id

  # OPERATIONS
  #-----------

  def self.create_using_temp_token(params, env=nil, headers={})
    jsonKeys = { 
        :additional_information => 0,
    }
    Request.send('post', uri_path("payment_sources","create_using_temp_token"), params, env, headers,nil, false, jsonKeys)
  end

  def self.create_using_permanent_token(params, env=nil, headers={})
    jsonKeys = { 
        :additional_information => 0,
    }
    Request.send('post', uri_path("payment_sources","create_using_permanent_token"), params, env, headers,nil, false, jsonKeys)
  end

  def self.create_using_token(params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("payment_sources","create_using_token"), params, env, headers,nil, false, jsonKeys)
  end

  def self.create_using_payment_intent(params, env=nil, headers={})
    jsonKeys = { 
        :additional_info => 1,
        :additional_information => 1,
    }
    Request.send('post', uri_path("payment_sources","create_using_payment_intent"), params, env, headers,nil, false, jsonKeys)
  end

  def self.create_voucher_payment_source(params, env=nil, headers={})
    jsonKeys = { 
        :billing_address => 1,
    }
    Request.send('post', uri_path("payment_sources","create_voucher_payment_source"), params, env, headers,nil, false, jsonKeys)
  end

  def self.create_card(params, env=nil, headers={})
    jsonKeys = { 
        :additional_information => 1,
    }
    Request.send('post', uri_path("payment_sources","create_card"), params, env, headers,nil, false, jsonKeys)
  end

  def self.create_bank_account(params, env=nil, headers={})
    jsonKeys = { 
        :billing_address => 1,
    }
    Request.send('post', uri_path("payment_sources","create_bank_account"), params, env, headers,nil, false, jsonKeys)
  end

  def self.update_card(id, params={}, env=nil, headers={})
    jsonKeys = { 
        :gateway_meta_data => 0,
        :additional_information => 1,
    }
    Request.send('post', uri_path("payment_sources",id.to_s,"update_card"), params, env, headers,nil, false, jsonKeys)
  end

  def self.update_bank_account(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("payment_sources",id.to_s,"update_bank_account"), params, env, headers,nil, false, jsonKeys)
  end

  def self.verify_bank_account(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("payment_sources",id.to_s,"verify_bank_account"), params, env, headers,nil, false, jsonKeys)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('get', uri_path("payment_sources",id.to_s), {}, env, headers,nil, false, jsonKeys)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send_list_request('get', uri_path("payment_sources"), params, env, headers,nil, false, jsonKeys)
  end

  def self.switch_gateway_account(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("payment_sources",id.to_s,"switch_gateway_account"), params, env, headers,nil, false, jsonKeys)
  end

  def self.export_payment_source(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("payment_sources",id.to_s,"export_payment_source"), params, env, headers,nil, false, jsonKeys)
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("payment_sources",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys)
  end

  def self.delete_local(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("payment_sources",id.to_s,"delete_local"), {}, env, headers,nil, false, jsonKeys)
  end

  end # ~PaymentSource
end # ~ChargeBee