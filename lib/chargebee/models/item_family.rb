module ChargeBee
  class ItemFamily < Model

  attr_accessor :id, :name, :description, :status, :resource_version, :updated_at, :channel, :business_entity_id,
  :deleted

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("item_families"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "itemFamily", telemetry_operation: "create")
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("item_families",id.to_s), {}, env, headers,nil, false, jsonKeys, options, telemetry_resource: "itemFamily", telemetry_operation: "retrieve")
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("item_families"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "itemFamily", telemetry_operation: "list")
  end

  def self.update(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("item_families",id.to_s), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "itemFamily", telemetry_operation: "update")
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("item_families",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys, options, telemetry_resource: "itemFamily", telemetry_operation: "delete")
  end

  end # ~ItemFamily
end # ~ChargeBee