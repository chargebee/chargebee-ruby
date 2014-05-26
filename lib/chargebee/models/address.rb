module ChargeBee
  class Address < Model

  attr_accessor :label, :first_name, :last_name, :email, :company, :phone, :addr, :extended_addr,
  :extended_addr2, :city, :state, :country, :zip, :subscription_id

  # OPERATIONS
  #-----------

  def self.retrieve(params, env=nil)
    Request.send('get', uri_path("addresses"), params, env)
  end

  def self.update(params, env=nil)
    Request.send('post', uri_path("addresses"), params, env)
  end

  end # ~Address
end # ~ChargeBee