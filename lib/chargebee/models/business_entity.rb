module ChargeBee
  class BusinessEntity < Model

  attr_accessor :id, :name, :status, :deleted, :created_at, :resource_version, :updated_at

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_entities"), params, env, headers,nil, false, jsonKeys, options, "businessEntity", "create")
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("business_entities"), params, env, headers,nil, false, jsonKeys, options, "businessEntity", "list")
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("business_entities",id.to_s), {}, env, headers,nil, false, jsonKeys, options, "businessEntity", "retrieve")
  end

  def self.update(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_entities",id.to_s), params, env, headers,nil, false, jsonKeys, options, "businessEntity", "update")
  end

  def self.create_transfers(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_entities","transfers"), params, env, headers,nil, false, jsonKeys, options, "businessEntity", "createTransfers")
  end

  def self.get_transfers(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("business_entities","transfers"), params, env, headers,nil, false, jsonKeys, options, "businessEntity", "getTransfers")
  end

  end # ~BusinessEntity
end # ~ChargeBee