module ChargeBee
  class Gift < Model

    class Gifter < Model
      attr_accessor :customer_id, :invoice_id, :signature, :note
    end

    class GiftReceiver < Model
      attr_accessor :customer_id, :subscription_id, :first_name, :last_name, :email
    end

    class GiftTimeline < Model
      attr_accessor :status, :occurred_at
    end

  attr_accessor :id, :status, :scheduled_at, :auto_claim, :no_expiry, :claim_expiry_date, :resource_version,
  :updated_at, :gifter, :gift_receiver, :gift_timelines

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
        :additional_information => 1,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("gifts"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.create_for_items(params, env=nil, headers={})
    jsonKeys = { 
        :meta_data => 0,
        :additional_information => 1,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("gifts","create_for_items"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("gifts",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("gifts"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.claim(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("gifts",id.to_s,"claim"), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.cancel(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("gifts",id.to_s,"cancel"), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.update_gift(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("gifts",id.to_s,"update_gift"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~Gift
end # ~ChargeBee