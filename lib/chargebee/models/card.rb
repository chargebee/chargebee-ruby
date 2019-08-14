module ChargeBee
  class Card < Model

  attr_accessor :status, :gateway, :reference_id, :first_name, :last_name, :iin, :last4, :card_type,
  :expiry_month, :expiry_year, :billing_addr1, :billing_addr2, :billing_city, :billing_state_code,
  :billing_state, :billing_country, :billing_zip, :ip_address, :customer_id, :masked_number

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("cards",id.to_s), {}, env, headers)
  end

  def self.update_card_for_customer(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"credit_card"), params, env, headers)
  end

  def self.update_card_for_customer_using_payment_intent(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"credit_card_using_payment_intent"), params, env, headers)
  end

  def self.switch_gateway_for_customer(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"switch_gateway"), params, env, headers)
  end

  def self.delete_card_for_customer(id, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"delete_card"), {}, env, headers)
  end

  end # ~Card
end # ~ChargeBee