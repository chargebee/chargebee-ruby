module ChargeBee
  class MeteredFeature < Model

  attr_accessor :id, :name, :description, :type, :status, :query, :column_definitions, :features

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("metered_features"), params, env, headers,nil, false, jsonKeys, options, "meteredFeature", "create")
  end

  def self.archive(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("metered_features",id.to_s,"archive_command"), {}, env, headers,nil, false, jsonKeys, options, "meteredFeature", "archive")
  end

  def self.reactivate(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("metered_features",id.to_s,"reactivate_command"), {}, env, headers,nil, false, jsonKeys, options, "meteredFeature", "reactivate")
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("metered_features",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys, options, "meteredFeature", "delete")
  end

  end # ~MeteredFeature
end # ~ChargeBee