module ChargeBee
  class VaultedPaymentMethod < Model

  attr_accessor :id, :customer_id, :credit_card_id, :created_at, :modified_at

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("vaulted_payment_methods",id.to_s), {}, env, headers,nil, false, jsonKeys, options, "vaultedPaymentMethod", "retrieve")
  end

  end # ~VaultedPaymentMethod
end # ~ChargeBee