module ChargeBee
  class CreditUnit < Model

  attr_accessor :id, :name, :external_name, :status, :resource_version, :updated_at, :created_at,
  :created_by, :updated_by, :is_unlimited, :overdraft_amount

  # OPERATIONS
  #-----------

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("credit_units"), params, env, headers,nil, false, jsonKeys, options, "creditUnit", "list")
  end

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_units"), params, env, headers,nil, false, jsonKeys, options, "creditUnit", "create")
  end

  def self.update(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_units",id.to_s), params, env, headers,nil, false, jsonKeys, options, "creditUnit", "update")
  end

  def self.archive(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_units",id.to_s,"archive_command"), {}, env, headers,nil, false, jsonKeys, options, "creditUnit", "archive")
  end

  def self.reactivate(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_units",id.to_s,"reactivate_command"), {}, env, headers,nil, false, jsonKeys, options, "creditUnit", "reactivate")
  end

  end # ~CreditUnit
end # ~ChargeBee