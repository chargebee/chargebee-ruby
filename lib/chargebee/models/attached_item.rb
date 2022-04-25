module ChargeBee
  class AttachedItem < Model

  attr_accessor :id, :parent_item_id, :item_id, :type, :status, :quantity, :quantity_in_decimal,
  :billing_cycles, :charge_on_event, :charge_once, :created_at, :resource_version, :updated_at,
  :channel

  # OPERATIONS
  #-----------

  def self.create(id, params, env=nil, headers={})
    Request.send('post', uri_path("items",id.to_s,"attached_items"), params, env, headers)
  end

  def self.update(id, params, env=nil, headers={})
    Request.send('post', uri_path("attached_items",id.to_s), params, env, headers)
  end

  def self.retrieve(id, params, env=nil, headers={})
    Request.send('get', uri_path("attached_items",id.to_s), params, env, headers)
  end

  def self.delete(id, params, env=nil, headers={})
    Request.send('post', uri_path("attached_items",id.to_s,"delete"), params, env, headers)
  end

  def self.list(id, params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("items",id.to_s,"attached_items"), params, env, headers)
  end

  end # ~AttachedItem
end # ~ChargeBee