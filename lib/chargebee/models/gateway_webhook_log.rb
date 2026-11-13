module ChargeBee
  class GatewayWebhookLog < Model

  attr_accessor :webhook_id, :url, :method, :status_code, :gateway, :id_at_gateway, :customer_handle,
  :invoice_handle, :transaction_handle, :payment_method_handle, :gateway_credential_handle, :payment_attempt_handle,
  :payment_intent_handle, :payment_method_name, :request_body, :response_body, :request_headers,
  :response_headers, :received_at, :response_time

  # OPERATIONS
  #-----------

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("gateway_webhook_logs"), params, env, headers,nil, false, jsonKeys, options, "gatewayWebhookLog", "list")
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("gateway_webhook_logs",id.to_s), {}, env, headers,nil, false, jsonKeys, options, "gatewayWebhookLog", "retrieve")
  end

  end # ~GatewayWebhookLog
end # ~ChargeBee