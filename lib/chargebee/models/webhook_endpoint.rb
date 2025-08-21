module ChargeBee
  class WebhookEndpoint < Model

  attr_accessor :id, :name, :url, :send_card_resource, :disabled, :primary_url, :api_version,
  :chargebee_response_schema_type, :enabled_events

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("webhook_endpoints"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.update(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("webhook_endpoints",id.to_s), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("webhook_endpoints",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("webhook_endpoints",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("webhook_endpoints"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~WebhookEndpoint
end # ~ChargeBee