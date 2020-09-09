module ChargeBee
  class Card < Model

  attr_accessor :payment_source_id, :status, :gateway, :gateway_account_id, :ref_tx_id, :first_name,
  :last_name, :iin, :last4, :card_type, :funding_type, :expiry_month, :expiry_year, :issuing_country,
  :billing_addr1, :billing_addr2, :billing_city, :billing_state_code, :billing_state, :billing_country,
  :billing_zip, :created_at, :resource_version, :updated_at, :ip_address, :powered_by, :customer_id,
  :masked_number

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("cards",id.to_s), {}, env, headers)
  end

  def self.update_card_for_customer(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"credit_card"), params, env, headers)
  end

  def self.switch_gateway_for_customer(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"switch_gateway"), params, env, headers)
  end

  def self.copy_card_for_customer(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"copy_card"), params, env, headers)
  end

  def self.delete_card_for_customer(id, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"delete_card"), {}, env, headers)
  end

  end # ~Card
end # ~ChargeBee