module ChargeBee
  class Dispute < Model

  attr_accessor :id, :customer_id, :transaction_id, :gateway_account_id, :id_at_gateway, :currency_code,
  :amount, :reason, :status, :type, :is_partial_dispute, :created_at, :resource_version, :updated_at

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("disputes",id.to_s), {}, env, headers,nil, false, jsonKeys, options, "dispute", "retrieve")
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("disputes"), params, env, headers,nil, false, jsonKeys, options, "dispute", "list")
  end

  end # ~Dispute
end # ~ChargeBee