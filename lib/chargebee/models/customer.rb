module ChargeBee
  class Customer < Model

    class BillingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip
    end

    class Contact < Model
      attr_accessor :id, :first_name, :last_name, :email, :phone, :label, :enabled, :send_account_email, :send_billing_email
    end

    class PaymentMethod < Model
      attr_accessor :type, :gateway, :status, :reference_id
    end

  attr_accessor :id, :first_name, :last_name, :email, :phone, :company, :vat_number, :auto_collection,
  :allow_direct_debit, :created_at, :created_from_ip, :taxability, :card_status, :billing_address,
  :contacts, :payment_method, :invoice_notes, :account_credits, :refundable_credits, :excess_payments

  # OPERATIONS
  #-----------

  def self.create(params={}, env=nil, headers={})
    Request.send('post', uri_path("customers"), params, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send('get', uri_path("customers"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("customers",id.to_s), {}, env, headers)
  end

  def self.update(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s), params, env, headers)
  end

  def self.update_payment_method(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"update_payment_method"), params, env, headers)
  end

  def self.update_billing_info(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"update_billing_info"), params, env, headers)
  end

  def self.add_contact(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"add_contact"), params, env, headers)
  end

  def self.update_contact(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"update_contact"), params, env, headers)
  end

  def self.delete_contact(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"delete_contact"), params, env, headers)
  end

  def self.add_account_credits(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"add_account_credits"), params, env, headers)
  end

  def self.deduct_account_credits(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"deduct_account_credits"), params, env, headers)
  end

  def self.set_account_credits(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"set_account_credits"), params, env, headers)
  end

  end # ~Customer
end # ~ChargeBee