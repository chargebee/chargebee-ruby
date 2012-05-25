module ChargeBee
  class Address < Model

  attr_accessor :label, :first_name, :last_name, :addr, :extended_addr, :city, :state, :country,
  :zip, :subscription_id

  # OPERATIONS
  #-----------
    
  def self.update(params, env=nil)
    Request.send('post', "/addresses", params, env)
  end    

  def self.retrieve(params, env=nil)
    Request.send('get', "/addresses", params, env)
  end    

  end # ~Address
end # ~ChargeBee    