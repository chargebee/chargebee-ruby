module ChargeBee
  class PortalSession < Model

  attr_accessor :id, :access_url, :redirect_url, :status, :created_at, :expires_at, :customer_id,
  :login_at, :logout_at, :login_ipaddress, :logout_ipaddress

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

  end # ~PortalSession
end # ~ChargeBee