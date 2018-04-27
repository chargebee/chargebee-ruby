module ChargeBee
  class VirtualBankAccount < Model

  attr_accessor :id, :customer_id, :email, :bank_name, :account_number, :routing_number, :swift_code,
  :gateway, :gateway_account_id, :reference_id, :deleted

  # OPERATIONS
  #-----------

  def self.create_using_permanent_token(params, env=nil, headers={})
    Request.send('post', uri_path("virtual_bank_accounts","create_using_permanent_token"), params, env, headers)
  end

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("virtual_bank_accounts"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("virtual_bank_accounts",id.to_s), {}, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("virtual_bank_accounts"), params, env, headers)
  end

  end # ~VirtualBankAccount
end # ~ChargeBee