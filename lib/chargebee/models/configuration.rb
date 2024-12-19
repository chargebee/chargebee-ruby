module ChargeBee
  class Configuration < Model

  attr_accessor :domain, :product_catalog_version

  # OPERATIONS
  #-----------

  def self.list(env=nil, headers={})
    Request.send_list_request('get', uri_path("configurations"), {}, env, headers)
  end

  end # ~Configuration
end # ~ChargeBee