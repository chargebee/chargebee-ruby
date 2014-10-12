module ChargeBee
  class Event < Model

  attr_accessor :id, :occurred_at, :source, :webhook_status, :webhook_failure_reason, :event_type

  class Content < Result
  end

  def content
    Content.new(@values[:content])
  end

  def self.deserialize(json)
    begin
      webhook_data = JSON.parse(json)
    rescue JSON::ParserError => e
      raise Error.new("Invalid webhook object to deserialize. #{e}",e)
    end
    webhook_data = Util.symbolize_keys(webhook_data)
    Event.construct(webhook_data)
  end

  # OPERATIONS
  #-----------

  def self.list(params={}, env=nil)
    Request.send('get', uri_path("events"), params, env)
  end

  def self.retrieve(id, env=nil)
    Request.send('get', uri_path("events",id.to_s), {}, env)
  end

  end # ~Event
end # ~ChargeBee
