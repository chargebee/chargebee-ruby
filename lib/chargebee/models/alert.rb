module ChargeBee
  class Alert < Model

  attr_accessor :id, :type, :name, :description, :metered_feature_id, :subscription_id, :status,
  :meta, :created_at, :updated_at

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("alerts"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "alert", telemetry_operation: "create")
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("alerts",id.to_s), {}, env, headers,nil, false, jsonKeys, options, telemetry_resource: "alert", telemetry_operation: "retrieve")
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("alerts"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "alert", telemetry_operation: "list")
  end

  def self.update(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("alerts",id.to_s), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "alert", telemetry_operation: "update")
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("alerts",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys, options, telemetry_resource: "alert", telemetry_operation: "delete")
  end

  def self.application_alerts_for_subscription(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("subscriptions",id.to_s,"applicable_alerts"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "alert", telemetry_operation: "applicationAlertsForSubscription")
  end

  end # ~Alert
end # ~ChargeBee