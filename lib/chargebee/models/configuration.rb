module ChargeBee
  class Configuration < Model

  attr_accessor :domain, :product_catalog_version, :chargebee_response_schema_type

  # OPERATIONS
  #-----------

  def self.list(env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("configurations"), {}, env, headers,nil, false, jsonKeys, options, telemetry_resource: "configuration", telemetry_operation: "list")
  end

  end # ~Configuration
end # ~ChargeBee