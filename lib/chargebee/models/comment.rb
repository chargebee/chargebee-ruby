module ChargeBee
  class Comment < Model

  attr_accessor :id, :entity_type, :added_by, :notes, :created_at, :type, :entity_id

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("comments"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("comments",id.to_s), {}, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("comments"), params, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("comments",id.to_s,"delete"), {}, env, headers)
  end

  end # ~Comment
end # ~ChargeBee