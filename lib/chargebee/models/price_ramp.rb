module ChargeBee
  class PriceRamp < Model

    class RampInterval < Model
      attr_accessor :starting_billing_cycle, :ending_billing_cycle, :apply_catalog_price, :price, :price_in_decimal
    end

  attr_accessor :id, :item_price_id, :status, :created_at, :resource_version, :updated_at, :archived_at,
  :ramp_intervals, :business_entity_id

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("price_ramps"), params, env, headers,nil, false, jsonKeys, options, "priceRamp", "create")
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("price_ramps",id.to_s), {}, env, headers,nil, false, jsonKeys, options, "priceRamp", "retrieve")
  end

  def self.update(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("price_ramps",id.to_s), params, env, headers,nil, false, jsonKeys, options, "priceRamp", "update")
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("price_ramps",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys, options, "priceRamp", "delete")
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("price_ramps"), params, env, headers,nil, false, jsonKeys, options, "priceRamp", "list")
  end

  end # ~PriceRamp
end # ~ChargeBee