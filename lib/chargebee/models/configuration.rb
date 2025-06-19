module ChargeBee
  class Configuration < Model

  attr_accessor :domain, :product_catalog_version, :chargebee_response_schema_type

  # OPERATIONS
  #-----------

  def self.list(env=nil, headers={})
    jsonKeys = { 
    }
    Request.send_list_request('get', uri_path("configurations"), {}, env, headers,nil, false, jsonKeys)
  end

  end # ~Configuration
end # ~ChargeBee