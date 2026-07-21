module ChargeBee
  class Meter < Model

  attr_accessor :id, :name, :description, :type, :status, :query, :created_at, :updated_at, :column_definitions,
  :features

  # OPERATIONS
  #-----------

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("meters"), params, env, headers,nil, false, jsonKeys, options, "meter", "list")
  end

  end # ~Meter
end # ~ChargeBee