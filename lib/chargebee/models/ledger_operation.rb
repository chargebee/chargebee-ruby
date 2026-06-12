module ChargeBee
  class LedgerOperation < Model

  attr_accessor :id, :type, :amount, :start_balance, :end_balance, :provisioned_start_balance,
  :provisioned_end_balance, :overdraft_start_balance, :overdraft_end_balance, :parent_ledger_operation_id,
  :ledger_operation_timestamp, :auto_release_timestamp, :metadata, :created_at, :modified_at,
  :subscription_id, :unit_id, :unit_type

  # OPERATIONS
  #-----------

  def self.retrieve_ledger_operation(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("ledger_operations",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.list_ledger_operations(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("ledger_operations"), params, env, headers,nil, true, jsonKeys, options)
  end

  def self.capture(params, env=nil, headers={})
    jsonKeys = { 
        :metadata => 0,
    }
    options = {}
    Request.send('post', uri_path("ledger_operations","capture"), params, env, headers,nil, true, jsonKeys, options)
  end

  def self.authorize(params, env=nil, headers={})
    jsonKeys = { 
        :metadata => 0,
    }
    options = {}
    Request.send('post', uri_path("ledger_operations","authorize"), params, env, headers,nil, true, jsonKeys, options)
  end

  def self.capture_authorization(params, env=nil, headers={})
    jsonKeys = { 
        :metadata => 0,
    }
    options = {}
    Request.send('post', uri_path("ledger_operations","capture_authorization"), params, env, headers,nil, true, jsonKeys, options)
  end

  def self.release_authorization(params, env=nil, headers={})
    jsonKeys = { 
        :metadata => 0,
    }
    options = {}
    Request.send('post', uri_path("ledger_operations","release_authorization"), params, env, headers,nil, true, jsonKeys, options)
  end

  end # ~LedgerOperation
end # ~ChargeBee