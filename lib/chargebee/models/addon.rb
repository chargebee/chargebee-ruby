module ChargeBee
  class Addon < Model

  attr_accessor :id, :name, :invoice_name, :description, :type, :charge_type, :price, :period,
  :period_unit, :unit, :status, :archived_at, :enabled_in_portal, :invoice_notes, :taxable

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("addons"), params, env, headers)
  end

  def self.update(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("addons",id.to_s), params, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send('get', uri_path("addons"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("addons",id.to_s), {}, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("addons",id.to_s,"delete"), {}, env, headers)
  end

  end # ~Addon
end # ~ChargeBee