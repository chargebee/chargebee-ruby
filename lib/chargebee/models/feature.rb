module ChargeBee
  class Feature < Model

    class Level < Model
      attr_accessor :name, :value, :level, :is_unlimited
    end

  attr_accessor :id, :name, :description, :status, :type, :unit, :resource_version, :updated_at,
  :created_at, :levels

  # OPERATIONS
  #-----------

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("features"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("features"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.update(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("features",id.to_s), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("features",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("features",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.activate(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("features",id.to_s,"activate_command"), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.archive(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("features",id.to_s,"archive_command"), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.reactivate(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("features",id.to_s,"reactivate_command"), {}, env, headers,nil, false, jsonKeys, options)
  end

  end # ~Feature
end # ~ChargeBee