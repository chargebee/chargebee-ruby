module ChargeBee
  class Comment < Model

  attr_accessor :id, :entity_type, :added_by, :notes, :created_at, :type, :entity_id

  # OPERATIONS
  #-----------
    
  def self.create(params, env=nil)
    Request.send('post', "/comments", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/comments/#{id.to_s}", {}, env)
  end    

  def self.list(params={}, env=nil)
    Request.send('get', "/comments", params, env)
  end    

  def self.delete(id, env=nil)
    Request.send('post', "/comments/#{id.to_s}/delete", {}, env)
  end    

  end # ~Comment
end # ~ChargeBee    