module ChargeBee
  class Addon < Model

  attr_accessor :id, :name, :invoice_name, :description, :type, :charge_type, :price, :period,
  :period_unit, :unit, :status, :archived_at, :invoice_notes

  # OPERATIONS
  #-----------

  def self.create(params, env=nil)
    Request.send('post', uri_path("addons"), params, env)
  end

  def self.update(id, params={}, env=nil)
    Request.send('post', uri_path("addons",id.to_s), params, env)
  end

  def self.list(params={}, env=nil)
    Request.send('get', uri_path("addons"), params, env)
  end

  def self.retrieve(id, env=nil)
    Request.send('get', uri_path("addons",id.to_s), {}, env)
  end

  def self.delete(id, env=nil)
    Request.send('post', uri_path("addons",id.to_s,"delete"), {}, env)
  end

  end # ~Addon
end # ~ChargeBee