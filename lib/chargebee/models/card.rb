module ChargeBee
  class Card < Model

  attr_accessor :customer_id, :status, :gateway, :first_name, :last_name, :iin, :last4, :card_type,
  :expiry_month, :expiry_year, :billing_addr1, :billing_addr2, :billing_city, :billing_state,
  :billing_country, :billing_zip, :masked_number

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil)
    Request.send('get', uri_path("cards",id.to_s), {}, env)
  end

  def self.update_card_for_customer(id, params, env=nil)
    Request.send('post', uri_path("customers",id.to_s,"credit_card"), params, env)
  end

  def self.delete_card_for_customer(id, env=nil)
    Request.send('post', uri_path("customers",id.to_s,"delete_card"), {}, env)
  end

  end # ~Card
end # ~ChargeBee