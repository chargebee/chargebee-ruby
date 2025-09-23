module ChargeBee
  class Currency < Model

  attr_accessor :id, :enabled, :forex_type, :currency_code, :is_base_currency, :manual_exchange_rate

  # OPERATIONS
  #-----------

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("currencies","list"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("currencies",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("currencies"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.update(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("currencies",id.to_s), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.add_schedule(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("currencies",id.to_s,"add_schedule"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.remove_schedule(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("currencies",id.to_s,"remove_schedule"), {}, env, headers,nil, false, jsonKeys, options)
  end

  end # ~Currency
end # ~ChargeBee