module ChargeBee
  class AlertStatus < Model

  attr_accessor :alert_id, :subscription_id, :alarm_status, :alarm_triggered_at

  # OPERATIONS
  #-----------

  def self.alert_statuses_for_subscription(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("subscriptions",id.to_s,"alert_statuses"), params, env, headers,nil, false, jsonKeys, options, "alertStatus", "alertStatusesForSubscription")
  end

  def self.alert_statuses_for_alert(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("alerts",id.to_s,"alert_statuses"), params, env, headers,nil, false, jsonKeys, options, "alertStatus", "alertStatusesForAlert")
  end

  end # ~AlertStatus
end # ~ChargeBee