module ChargeBee
  class ItemFamily < Model

  attr_accessor :id, :name, :description, :status, :resource_version, :updated_at, :channel, :business_entity_id,
  :deleted

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("item_families"), params, env, headers,nil, false, jsonKeys)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('get', uri_path("item_families",id.to_s), {}, env, headers,nil, false, jsonKeys)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send_list_request('get', uri_path("item_families"), params, env, headers,nil, false, jsonKeys)
  end

  def self.update(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("item_families",id.to_s), params, env, headers,nil, false, jsonKeys)
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("item_families",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys)
  end

  end # ~ItemFamily
end # ~ChargeBee