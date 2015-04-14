module ChargeBee
  class Customer < Model

    class BillingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip
    end

    class PaymentMethod < Model
      attr_accessor :type, :status, :reference_id
    end

  attr_accessor :id, :first_name, :last_name, :email, :phone, :company, :vat_number, :auto_collection,
  :created_at, :created_from_ip, :card_status, :billing_address, :payment_method, :invoice_notes

  # OPERATIONS
  #-----------

  def self.create(params={}, env=nil)
    Request.send('post', uri_path("customers"), params, env)
  end

  def self.list(params={}, env=nil)
    Request.send('get', uri_path("customers"), params, env)
  end

  def self.retrieve(id, env=nil)
    Request.send('get', uri_path("customers",id.to_s), {}, env)
  end

  def self.update(id, params={}, env=nil)
    Request.send('post', uri_path("customers",id.to_s), params, env)
  end

  def self.update_billing_info(id, params={}, env=nil)
    Request.send('post', uri_path("customers",id.to_s,"update_billing_info"), params, env)
  end

  end # ~Customer
end # ~ChargeBee