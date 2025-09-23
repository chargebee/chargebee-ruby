module ChargeBee
  class OfferEvent < Model


  # OPERATIONS
  #-----------

  def self.offer_events(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("offer_events"), params, env, headers, "grow", true, jsonKeys, options)
  end

  end # ~OfferEvent
end # ~ChargeBee