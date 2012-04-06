module ChargeBee
  class HostedPage < Model

  attr_accessor :id, :type, :url, :state, :failure_reason, :pass_thru_content, :created_at, :expires_at

  class Content < Result
  end

  def content
    Content.new(@values[:content])
  end

  # OPERATIONS
  #-----------
    
  def self.checkout_new(params, env=nil)
    Request.send('post', "/hosted_pages/checkout_new", params, env)
  end    

  def self.checkout_existing(params, env=nil)
    Request.send('post', "/hosted_pages/checkout_existing", params, env)
  end    

  def self.update_card(params, env=nil)
    Request.send('post', "/hosted_pages/update_card", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/hosted_pages/#{id.to_s}", env)
  end    

  end # ~HostedPage
end # ~ChargeBee    