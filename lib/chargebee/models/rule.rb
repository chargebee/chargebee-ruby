module ChargeBee
  class Rule < Model

  attr_accessor :id, :namespace, :rule_name, :rule_order, :status, :conditions, :outcome, :deleted,
  :created_at, :modified_at

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("rules",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  end # ~Rule
end # ~ChargeBee