module ChargeBee
  class Usage < Model

  attr_accessor :id, :usage_date, :subscription_id, :item_price_id, :invoice_id, :line_item_id,
  :quantity, :source, :note, :resource_version, :updated_at, :created_at

  # OPERATIONS
  #-----------

  def self.create(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("subscriptions",id.to_s,"usages"), params, env, headers,nil, false, jsonKeys)
  end

  def self.retrieve(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('get', uri_path("subscriptions",id.to_s,"usages"), params, env, headers,nil, false, jsonKeys)
  end

  def self.delete(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("subscriptions",id.to_s,"delete_usage"), params, env, headers,nil, false, jsonKeys)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send_list_request('get', uri_path("usages"), params, env, headers,nil, false, jsonKeys)
  end

  def self.pdf(params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("usages","pdf"), params, env, headers,nil, false, jsonKeys)
  end

  end # ~Usage
end # ~ChargeBee