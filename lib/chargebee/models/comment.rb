module ChargeBee
  class Comment < Model

  attr_accessor :id, :entity_type, :added_by, :notes, :created_at, :type, :entity_id

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("comments"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("comments",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("comments"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("comments",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys, options)
  end

  end # ~Comment
end # ~ChargeBee