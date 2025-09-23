module ChargeBee
  class OfferFulfillment < Model

    class Error < Model
      attr_accessor :code, :message
    end

  attr_accessor :id, :personalized_offer_id, :option_id, :processing_type, :status, :redirect_url,
  :failed_at, :created_at, :completed_at, :error

  # OPERATIONS
  #-----------

  def self.offer_fulfillments(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("offer_fulfillments"), params, env, headers, "grow", true, jsonKeys, options)
  end

  def self.offer_fulfillments_get(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("offer_fulfillments",id.to_s), {}, env, headers, "grow", true, jsonKeys, options)
  end

  def self.offer_fulfillments_update(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("offer_fulfillments",id.to_s), params, env, headers, "grow", true, jsonKeys, options)
  end

  end # ~OfferFulfillment
end # ~ChargeBee