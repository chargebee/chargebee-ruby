module ChargeBee
  class UsageEvent < Model

  attr_accessor :subscription_id, :deduplication_id, :usage_timestamp, :properties

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
        :properties => 0,
    }
    Request.send('post', uri_path("usage_events"), params, env, headers, "ingest", true, jsonKeys)
  end

  def self.batch_ingest(params, env=nil, headers={})
    jsonKeys = { 
        :properties => 1,
    }
    Request.send('post', uri_path("batch","usage_events"), params, env, headers, "ingest", true, jsonKeys)
  end

  end # ~UsageEvent
end # ~ChargeBee