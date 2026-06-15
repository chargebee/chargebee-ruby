module ChargeBee
  class PromotionalGrant < Model

  attr_accessor :subscription_id, :unit_id, :amount, :expires_at, :metadata

  # OPERATIONS
  #-----------

  def self.promotional_grants(params, env=nil, headers={})
    jsonKeys = { 
        :metadata => 0,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("promotional_grants"), params, env, headers,nil, true, jsonKeys, options)
  end

  end # ~PromotionalGrant
end # ~ChargeBee