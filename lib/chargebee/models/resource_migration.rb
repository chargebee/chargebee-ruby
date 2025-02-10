module ChargeBee
  class ResourceMigration < Model

  attr_accessor :from_site, :entity_type, :entity_id, :status, :errors, :created_at, :updated_at

  # OPERATIONS
  #-----------

  def self.retrieve_latest(params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('get', uri_path("resource_migrations","retrieve_latest"), params, env, headers,nil, false, jsonKeys)
  end

  end # ~ResourceMigration
end # ~ChargeBee