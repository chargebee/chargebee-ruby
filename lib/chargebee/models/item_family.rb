module ChargeBee
  class ItemFamily < Model

  attr_accessor :id, :name, :description, :status, :resource_version, :updated_at, :channel

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("item_families"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("item_families",id.to_s), {}, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("item_families"), params, env, headers)
  end

  def self.update(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("item_families",id.to_s), params, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("item_families",id.to_s,"delete"), {}, env, headers)
  end

  end # ~ItemFamily
end # ~ChargeBee