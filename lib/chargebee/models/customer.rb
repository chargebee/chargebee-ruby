module ChargeBee
  class Customer < Model

  attr_accessor :id, :first_name, :last_name, :email, :company, :created_at, :card_status

  # OPERATIONS
  #-----------
    
  def self.list(params={}, env=nil)
    Request.send('get', "/customers", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/customers/#{id.to_s}", env)
  end    

  def self.update(id, params={}, env=nil)
    Request.send('post', "/customers/#{id.to_s}", params, env)
  end    

  end # ~Customer
end # ~ChargeBee    