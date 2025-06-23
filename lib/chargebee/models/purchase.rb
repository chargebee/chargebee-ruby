module ChargeBee
  class Purchase < Model

  attr_accessor :id, :customer_id, :created_at, :modified_at, :subscription_ids, :invoice_ids

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
        :additional_information => 1,
        :meta_data => 1,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("purchases"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.estimate(params, env=nil, headers={})
    jsonKeys = { 
        :exemption_details => 1,
    }
    options = {}
    Request.send('post', uri_path("purchases","estimate"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~Purchase
end # ~ChargeBee