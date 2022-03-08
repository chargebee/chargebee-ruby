module ChargeBee
  class PaymentSource < Model

    class Card < Model
      attr_accessor :first_name, :last_name, :iin, :last4, :brand, :funding_type, :expiry_month, :expiry_year, :billing_addr1, :billing_addr2, :billing_city, :billing_state_code, :billing_state, :billing_country, :billing_zip, :masked_number
    end

    class BankAccount < Model
      attr_accessor :last4, :name_on_account, :first_name, :last_name, :bank_name, :mandate_id, :account_type, :echeck_type, :account_holder_type, :email
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

    class Mandate < Model
      attr_accessor :id, :subscription_id, :created_at
    end

  attr_accessor :id, :resource_version, :updated_at, :created_at, :customer_id, :type, :reference_id,
  :status, :gateway, :gateway_account_id, :ip_address, :issuing_country, :card, :bank_account,
  :amazon_payment, :upi, :paypal, :mandates, :deleted

  # OPERATIONS
  #-----------

  def self.create_using_temp_token(params, env=nil, headers={})
    Request.send('post', uri_path("payment_sources","create_using_temp_token"), params, env, headers)
  end

  def self.create_using_permanent_token(params, env=nil, headers={})
    Request.send('post', uri_path("payment_sources","create_using_permanent_token"), params, env, headers)
  end

  def self.create_using_token(params, env=nil, headers={})
    Request.send('post', uri_path("payment_sources","create_using_token"), params, env, headers)
  end

  def self.create_using_payment_intent(params, env=nil, headers={})
    Request.send('post', uri_path("payment_sources","create_using_payment_intent"), params, env, headers)
  end

  def self.create_card(params, env=nil, headers={})
    Request.send('post', uri_path("payment_sources","create_card"), params, env, headers)
  end

  def self.create_bank_account(params, env=nil, headers={})
    Request.send('post', uri_path("payment_sources","create_bank_account"), params, env, headers)
  end

  def self.update_card(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("payment_sources",id.to_s,"update_card"), params, env, headers)
  end

  def self.update_bank_account(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("payment_sources",id.to_s,"update_bank_account"), params, env, headers)
  end

  def self.verify_bank_account(id, params, env=nil, headers={})
    Request.send('post', uri_path("payment_sources",id.to_s,"verify_bank_account"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("payment_sources",id.to_s), {}, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("payment_sources"), params, env, headers)
  end

  def self.switch_gateway_account(id, params, env=nil, headers={})
    Request.send('post', uri_path("payment_sources",id.to_s,"switch_gateway_account"), params, env, headers)
  end

  def self.export_payment_source(id, params, env=nil, headers={})
    Request.send('post', uri_path("payment_sources",id.to_s,"export_payment_source"), params, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("payment_sources",id.to_s,"delete"), {}, env, headers)
  end

  def self.delete_local(id, env=nil, headers={})
    Request.send('post', uri_path("payment_sources",id.to_s,"delete_local"), {}, env, headers)
  end

  end # ~PaymentSource
end # ~ChargeBee