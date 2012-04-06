module ChargeBee
  class Card < Model

  attr_accessor :customer_id, :status, :gateway, :first_name, :last_name, :iin, :last4, :card_type,
  :expiry_month, :expiry_year, :masked_number

  # OPERATIONS
  #-----------
    
  def self.retrieve(id, env=nil)
    Request.send('get', "/cards/#{id.to_s}", env)
  end    

  def self.update_card_for_customer(id, params, env=nil)
    Request.send('post', "/customers/#{id.to_s}/credit_card", params, env)
  end    

  end # ~Card
end # ~ChargeBee    