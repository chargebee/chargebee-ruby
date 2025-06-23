module ChargeBee
  class ItemPrice < Model

    class Tier < Model
      attr_accessor :starting_unit, :ending_unit, :price, :starting_unit_in_decimal, :ending_unit_in_decimal, :price_in_decimal, :pricing_type, :package_size
    end

    class TaxDetail < Model
      attr_accessor :tax_profile_id, :avalara_sale_type, :avalara_transaction_type, :avalara_service_type, :avalara_tax_code, :hsn_code, :taxjar_product_code
    end

    class TaxProvidersField < Model
      attr_accessor :provider_name, :field_id, :field_value
    end

    class AccountingDetail < Model
      attr_accessor :sku, :accounting_code, :accounting_category1, :accounting_category2, :accounting_category3, :accounting_category4
    end

  attr_accessor :id, :name, :item_family_id, :item_id, :description, :status, :external_name,
  :price_variant_id, :proration_type, :pricing_model, :price, :price_in_decimal, :period, :currency_code,
  :period_unit, :trial_period, :trial_period_unit, :trial_end_action, :shipping_period, :shipping_period_unit,
  :billing_cycles, :free_quantity, :free_quantity_in_decimal, :channel, :resource_version, :updated_at,
  :created_at, :usage_accumulation_reset_frequency, :archived_at, :invoice_notes, :tiers, :is_taxable,
  :tax_detail, :tax_providers_fields, :accounting_detail, :metadata, :item_type, :archivable,
  :parent_item_id, :show_description_in_invoices, :show_description_in_quotes, :deleted, :business_entity_id

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
        :metadata => 0,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("item_prices"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("item_prices",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.update(id, params, env=nil, headers={})
    jsonKeys = { 
        :metadata => 0,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("item_prices",id.to_s), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("item_prices"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("item_prices",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.find_applicable_items(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("item_prices",id.to_s,"applicable_items"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.find_applicable_item_prices(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("item_prices",id.to_s,"applicable_item_prices"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~ItemPrice
end # ~ChargeBee