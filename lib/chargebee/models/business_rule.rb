module ChargeBee
  class BusinessRule < Model

  attr_accessor :id, :name, :description, :latest_version, :active, :released_at, :released_by,
  :updated_at, :updated_by, :created_by, :created_at, :tags, :structured_expression, :actions_on_success,
  :resource_version

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
        :tags => 0,
        :structured_expression => 0,
        :actions_on_success => 0,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rules"), params, env, headers,nil, false, jsonKeys, options, "businessRule", "create")
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rules",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys, options, "businessRule", "delete")
  end

  def self.update_draft(id, params, env=nil, headers={})
    jsonKeys = { 
        :tags => 0,
        :structured_expression => 0,
        :actions_on_success => 0,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rules",id.to_s,"draft"), params, env, headers,nil, false, jsonKeys, options, "businessRule", "updateDraft")
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("business_rules"), params, env, headers,nil, false, jsonKeys, options, "businessRule", "list")
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("business_rules",id.to_s), {}, env, headers,nil, false, jsonKeys, options, "businessRule", "retrieve")
  end

  def self.retrieve_draft(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("business_rules",id.to_s,"draft"), {}, env, headers,nil, false, jsonKeys, options, "businessRule", "retrieveDraft")
  end

  def self.delete_draft(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rules",id.to_s,"delete_draft"), {}, env, headers,nil, false, jsonKeys, options, "businessRule", "deleteDraft")
  end

  def self.activate_rule(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rules",id.to_s,"activate"), {}, env, headers,nil, false, jsonKeys, options, "businessRule", "activateRule")
  end

  def self.deactivate_rule(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rules",id.to_s,"deactivate"), {}, env, headers,nil, false, jsonKeys, options, "businessRule", "deactivateRule")
  end

  def self.release_rule(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rules",id.to_s,"release"), {}, env, headers,nil, false, jsonKeys, options, "businessRule", "releaseRule")
  end

  def self.apply_rules(params={}, env=nil, headers={})
    jsonKeys = { 
        :structured_expression => 0,
        :context => 0,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("business_rules","apply_rules"), params, env, headers,nil, false, jsonKeys, options, "businessRule", "applyRules")
  end

  end # ~BusinessRule
end # ~ChargeBee