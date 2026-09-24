module ChargeBee
  class BusinessRuleset < Model

  attr_accessor :id, :name, :description, :active, :execute_mode, :updated_at, :updated_by, :created_by,
  :created_at, :rules, :resource_version

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
        :rules => 0,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rulesets"), params, env, headers,nil, false, jsonKeys, options, "businessRuleset", "create")
  end

  def self.update(id, params, env=nil, headers={})
    jsonKeys = { 
        :rules => 0,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rulesets",id.to_s), params, env, headers,nil, false, jsonKeys, options, "businessRuleset", "update")
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rulesets",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys, options, "businessRuleset", "delete")
  end

  def self.activate(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rulesets",id.to_s,"activate"), {}, env, headers,nil, false, jsonKeys, options, "businessRuleset", "activate")
  end

  def self.deactivate(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rulesets",id.to_s,"deactivate"), {}, env, headers,nil, false, jsonKeys, options, "businessRuleset", "deactivate")
  end

  def self.add_rules(id, params={}, env=nil, headers={})
    jsonKeys = { 
        :rules => 0,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rulesets",id.to_s,"add_rules"), params, env, headers,nil, false, jsonKeys, options, "businessRuleset", "addRules")
  end

  def self.remove_rules(id, params={}, env=nil, headers={})
    jsonKeys = { 
        :rules => 0,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rulesets",id.to_s,"remove_rules"), params, env, headers,nil, false, jsonKeys, options, "businessRuleset", "removeRules")
  end

  def self.list_rules(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("business_rulesets",id.to_s,"rules"), params, env, headers,nil, false, jsonKeys, options, "businessRuleset", "listRules")
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("business_rulesets"), params, env, headers,nil, false, jsonKeys, options, "businessRuleset", "list")
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("business_rulesets",id.to_s), {}, env, headers,nil, false, jsonKeys, options, "businessRuleset", "retrieve")
  end

  end # ~BusinessRuleset
end # ~ChargeBee