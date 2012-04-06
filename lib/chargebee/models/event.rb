module ChargeBee
  class Event < Model

  attr_accessor :id, :occurred_at, :webhook_status, :webhook_failure_reason, :event_type

  class Content < Result
  end

  def content
    Content.new(@values[:content])
  end

  # OPERATIONS
  #-----------
    
  def self.list(params={}, env=nil)
    Request.send('get', "/events", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/events/#{id.to_s}", {}, env)
  end    

  end # ~Event
end # ~ChargeBee    