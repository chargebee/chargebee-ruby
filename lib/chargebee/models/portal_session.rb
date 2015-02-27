module ChargeBee
  class PortalSession < Model

    class LinkedCustomer < Model
      attr_accessor :customer_id, :email, :has_billing_address, :has_payment_method, :has_active_subscription
    end

  attr_accessor :id, :token, :access_url, :redirect_url, :status, :created_at, :expires_at, :customer_id,
  :login_at, :logout_at, :login_ipaddress, :logout_ipaddress, :linked_customers

  # OPERATIONS
  #-----------

  def self.create(params, env=nil)
    Request.send('post', uri_path("portal_sessions"), params, env)
  end

  def self.retrieve(id, env=nil)
    Request.send('get', uri_path("portal_sessions",id.to_s), {}, env)
  end

  def self.logout(id, env=nil)
    Request.send('post', uri_path("portal_sessions",id.to_s,"logout"), {}, env)
  end

  def self.activate(id, params, env=nil)
    Request.send('post', uri_path("portal_sessions",id.to_s,"activate"), params, env)
  end

  end # ~PortalSession
end # ~ChargeBee