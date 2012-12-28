module ChargeBee
  class OfflineCheckout < Model

  attr_accessor :id, :type, :amount, :status, :created_at, :updated_at

  # OPERATIONS
  #-----------
    
  def self.retrieve(id, env=nil)
    Request.send('get', "/offline_checkouts/#{id.to_s}", {}, env)
  end    

  def self.pre_register(params, env=nil)
    Request.send('post', "/offline_checkouts/pre_register", params, env)
  end    

  def self.post_register(id, params, env=nil)
    Request.send('post', "/offline_checkouts/#{id.to_s}/post_register", params, env)
  end    

  end # ~OfflineCheckout
end # ~ChargeBee    