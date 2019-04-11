module ChargeBee
  class Address < Model

  attr_accessor :label, :first_name, :last_name, :email, :company, :phone, :addr, :extended_addr,
  :extended_addr2, :city, :state_code, :state, :country, :zip, :validation_status, :subscription_id

  # OPERATIONS
  #-----------

  def self.retrieve(params, env=nil, headers={})
    Request.send('get', uri_path("addresses"), params, env, headers)
  end

  def self.update(params, env=nil, headers={})
    Request.send('post', uri_path("addresses"), params, env, headers)
  end

  end # ~Address
end # ~ChargeBee