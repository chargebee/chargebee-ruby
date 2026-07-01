module ChargeBee
  class PromotionalCredit < Model

  attr_accessor :id, :customer_id, :type, :amount_in_decimal, :amount, :currency_code, :description,
  :credit_type, :reference, :closing_balance, :done_by, :created_at, :business_entity_id

  # OPERATIONS
  #-----------

  def self.add(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("promotional_credits","add"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "promotionalCredit", telemetry_operation: "add")
  end

  def self.deduct(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("promotional_credits","deduct"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "promotionalCredit", telemetry_operation: "deduct")
  end

  def self.set(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("promotional_credits","set"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "promotionalCredit", telemetry_operation: "set")
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("promotional_credits"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "promotionalCredit", telemetry_operation: "list")
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("promotional_credits",id.to_s), {}, env, headers,nil, false, jsonKeys, options, telemetry_resource: "promotionalCredit", telemetry_operation: "retrieve")
  end

  end # ~PromotionalCredit
end # ~ChargeBee