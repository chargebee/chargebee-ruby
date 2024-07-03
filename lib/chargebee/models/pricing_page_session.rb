module ChargeBee
  class PricingPageSession < Model

  attr_accessor :id, :url, :created_at, :expires_at

  # OPERATIONS
  #-----------

  def self.create_for_new_subscription(params, env=nil, headers={})
    Request.send('post', uri_path("pricing_page_sessions","create_for_new_subscription"), params, env, headers)
  end

  def self.create_for_existing_subscription(params, env=nil, headers={})
    Request.send('post', uri_path("pricing_page_sessions","create_for_existing_subscription"), params, env, headers)
  end

  end # ~PricingPageSession
end # ~ChargeBee