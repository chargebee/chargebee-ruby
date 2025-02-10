module ChargeBee
  class BusinessEntity < Model

  attr_accessor :id, :name, :status, :deleted, :created_at, :resource_version, :updated_at

  # OPERATIONS
  #-----------

  def self.create_transfers(params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("business_entities","transfers"), params, env, headers,nil, false, jsonKeys)
  end

  def self.get_transfers(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('get', uri_path("business_entities","transfers"), params, env, headers,nil, false, jsonKeys)
  end

  end # ~BusinessEntity
end # ~ChargeBee