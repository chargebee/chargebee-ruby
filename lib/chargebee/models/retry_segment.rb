module ChargeBee
  class RetrySegment < Model

  attr_accessor :id, :name, :invoice_id, :enabled, :priority, :condition_logic, :criteria, :retry_settings

  # OPERATIONS
  #-----------

  def self.retrieve(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("retry_segments",id.to_s), params, env, headers,nil, false, jsonKeys, options, "retrySegment", "retrieve")
  end

  end # ~RetrySegment
end # ~ChargeBee