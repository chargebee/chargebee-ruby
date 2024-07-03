module ChargeBee
  class Currency < Model

  attr_accessor :id, :enabled, :forex_type, :currency_code, :is_base_currency, :manual_exchange_rate

  # OPERATIONS
  #-----------

  def self.list(env=nil, headers={})
    Request.send_list_request('get', uri_path("currencies","list"), {}, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("currencies",id.to_s), {}, env, headers)
  end

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("currencies"), params, env, headers)
  end

  def self.update(id, params, env=nil, headers={})
    Request.send('post', uri_path("currencies",id.to_s), params, env, headers)
  end

  def self.add_schedule(id, params, env=nil, headers={})
    Request.send('post', uri_path("currencies",id.to_s,"add_schedule"), params, env, headers)
  end

  def self.remove_schedule(id, env=nil, headers={})
    Request.send('post', uri_path("currencies",id.to_s,"remove_schedule"), {}, env, headers)
  end

  end # ~Currency
end # ~ChargeBee