module ChargeBee
  class Item < Model

    class ApplicableItem < Model
      attr_accessor :id
    end

    class BundleItem < Model
      attr_accessor :item_id, :item_type, :quantity, :price_allocation
    end

    class BundleConfiguration < Model
      attr_accessor :type
    end

  attr_accessor :id, :name, :external_name, :description, :status, :resource_version, :updated_at,
  :item_family_id, :type, :is_shippable, :is_giftable, :redirect_url, :enabled_for_checkout, :enabled_in_portal,
  :included_in_mrr, :item_applicability, :gift_claim_redirect_url, :unit, :metered, :usage_calculation,
  :is_percentage_pricing, :archived_at, :channel, :applicable_items, :bundle_items, :bundle_configuration,
  :metadata, :deleted, :business_entity_id

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
        :metadata => 0,
    }
    Request.send('post', uri_path("items"), params, env, headers,nil, false, jsonKeys)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('get', uri_path("items",id.to_s), {}, env, headers,nil, false, jsonKeys)
  end

  def self.update(id, params={}, env=nil, headers={})
    jsonKeys = { 
        :metadata => 0,
    }
    Request.send('post', uri_path("items",id.to_s), params, env, headers,nil, false, jsonKeys)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send_list_request('get', uri_path("items"), params, env, headers,nil, false, jsonKeys)
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("items",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys)
  end

  end # ~Item
end # ~ChargeBee