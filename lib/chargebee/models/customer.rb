module ChargeBee
  class Customer < Model

    class BillingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state, :country, :zip
    end

  attr_accessor :id, :first_name, :last_name, :email, :phone, :company, :vat_number, :auto_collection,
  :created_at, :card_status, :billing_address

  # OPERATIONS
  #-----------
    
  def self.list(params={}, env=nil)
    Request.send('get', "/customers", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/customers/#{id.to_s}", {}, env)
  end    

  def self.update(id, params={}, env=nil)
    Request.send('post', "/customers/#{id.to_s}", params, env)
  end    

  def self.update_billing_info(id, params={}, env=nil)
    Request.send('post', "/customers/#{id.to_s}/update_billing_info", params, env)
  end    

  end # ~Customer
end # ~ChargeBee    