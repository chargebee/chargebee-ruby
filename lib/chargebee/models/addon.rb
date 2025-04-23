module ChargeBee
  class Addon < Model

    class Tier < Model
      attr_accessor :starting_unit, :ending_unit, :price, :starting_unit_in_decimal, :ending_unit_in_decimal, :price_in_decimal, :pricing_type, :package_size
    end

    class TaxProvidersField < Model
      attr_accessor :provider_name, :field_id, :field_value
    end

  attr_accessor :id, :name, :invoice_name, :description, :pricing_model, :type, :charge_type,
  :price, :currency_code, :period, :period_unit, :unit, :status, :archived_at, :enabled_in_portal,
  :tax_code, :hsn_code, :taxjar_product_code, :avalara_sale_type, :avalara_transaction_type, :avalara_service_type,
  :sku, :accounting_code, :accounting_category1, :accounting_category2, :accounting_category3,
  :accounting_category4, :is_shippable, :shipping_frequency_period, :shipping_frequency_period_unit,
  :resource_version, :updated_at, :price_in_decimal, :included_in_mrr, :channel, :proration_type,
  :invoice_notes, :taxable, :tax_profile_id, :meta_data, :tiers, :tax_providers_fields, :show_description_in_invoices,
  :show_description_in_quotes

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
        :meta_data => 0,
    }
    Request.send('post', uri_path("addons"), params, env, headers,nil, false, jsonKeys)
  end

  def self.update(id, params, env=nil, headers={})
    jsonKeys = { 
        :meta_data => 0,
    }
    Request.send('post', uri_path("addons",id.to_s), params, env, headers,nil, false, jsonKeys)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send_list_request('get', uri_path("addons"), params, env, headers,nil, false, jsonKeys)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('get', uri_path("addons",id.to_s), {}, env, headers,nil, false, jsonKeys)
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("addons",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys)
  end

  def self.copy(params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("addons","copy"), params, env, headers,nil, false, jsonKeys)
  end

  def self.unarchive(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("addons",id.to_s,"unarchive"), {}, env, headers,nil, false, jsonKeys)
  end

  end # ~Addon
end # ~ChargeBee