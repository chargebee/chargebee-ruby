module ChargeBee
  class GatewayRequestLog < Model

  attr_accessor :log_id, :url, :status_code, :method, :request_body, :response_body, :request_headers,
  :response_headers, :gateway, :customer_handle, :invoice_handle, :transaction_handle, :payment_method_handle,
  :gateway_credential_handle, :payment_attempt_handle, :payment_intent_handle, :payment_method_name,
  :operation_name, :operation_type, :action_type, :source, :trace_id_hash, :invocation_time, :response_received_at,
  :response_time

  # OPERATIONS
  #-----------

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("gateway_request_logs"), params, env, headers,nil, false, jsonKeys, options, "gatewayRequestLog", "list")
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("gateway_request_logs",id.to_s), {}, env, headers,nil, false, jsonKeys, options, "gatewayRequestLog", "retrieve")
  end

  end # ~GatewayRequestLog
end # ~ChargeBee