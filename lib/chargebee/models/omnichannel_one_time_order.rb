module ChargeBee
  class OmnichannelOneTimeOrder < Model

  attr_accessor :id, :app_id, :customer_id, :id_at_source, :origin, :source, :created_at, :resource_version,
  :omnichannel_one_time_order_items, :purchase_transaction

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("omnichannel_one_time_orders",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("omnichannel_one_time_orders"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~OmnichannelOneTimeOrder
end # ~ChargeBee