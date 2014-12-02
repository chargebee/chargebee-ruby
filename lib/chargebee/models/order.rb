module ChargeBee
  class Order < Model

  attr_accessor :id, :invoice_id, :status, :reference_id, :fulfillment_status, :note, :tracking_id,
  :batch_id, :created_by, :created_at, :status_update_at

  # OPERATIONS
  #-----------

  def self.create(params, env=nil)
    Request.send('post', uri_path("orders"), params, env)
  end

  def self.update(id, params={}, env=nil)
    Request.send('post', uri_path("orders",id.to_s), params, env)
  end

  def self.retrieve(id, env=nil)
    Request.send('get', uri_path("orders",id.to_s), {}, env)
  end

  def self.list(params={}, env=nil)
    Request.send('get', uri_path("orders"), params, env)
  end

  def self.orders_for_invoice(id, params={}, env=nil)
    Request.send('get', uri_path("invoices",id.to_s,"orders"), params, env)
  end

  end # ~Order
end # ~ChargeBee