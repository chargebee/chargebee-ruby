module ChargeBee
  class Plan < Model

    class Tier < Model
      attr_accessor :starting_unit, :ending_unit, :price, :starting_unit_in_decimal, :ending_unit_in_decimal, :price_in_decimal
    end

    class TaxProvidersField < Model
      attr_accessor :provider_name, :field_id, :field_value
    end

    class ApplicableAddon < Model
      attr_accessor :id
    end

    class AttachedAddon < Model
      attr_accessor :id, :quantity, :billing_cycles, :type, :quantity_in_decimal
    end

    class EventBasedAddon < Model
      attr_accessor :id, :quantity, :on_event, :charge_once, :quantity_in_decimal
    end

  attr_accessor :id, :name, :invoice_name, :description, :price, :currency_code, :period, :period_unit,
  :trial_period, :trial_period_unit, :trial_end_action, :pricing_model, :charge_model, :free_quantity,
  :setup_cost, :downgrade_penalty, :status, :archived_at, :billing_cycles, :redirect_url, :enabled_in_hosted_pages,
  :enabled_in_portal, :addon_applicability, :tax_code, :hsn_code, :taxjar_product_code, :avalara_sale_type,
  :avalara_transaction_type, :avalara_service_type, :sku, :accounting_code, :accounting_category1,
  :accounting_category2, :accounting_category3, :accounting_category4, :is_shippable, :shipping_frequency_period,
  :shipping_frequency_period_unit, :resource_version, :updated_at, :giftable, :claim_url, :free_quantity_in_decimal,
  :price_in_decimal, :channel, :invoice_notes, :taxable, :tax_profile_id, :meta_data, :tiers,
  :tax_providers_fields, :applicable_addons, :attached_addons, :event_based_addons, :show_description_in_invoices,
  :show_description_in_quotes

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
        :meta_data => 0,
    }
    Request.send('post', uri_path("plans"), params, env, headers,nil, false, jsonKeys)
  end

  def self.update(id, params, env=nil, headers={})
    jsonKeys = { 
        :meta_data => 0,
    }
    Request.send('post', uri_path("plans",id.to_s), params, env, headers,nil, false, jsonKeys)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send_list_request('get', uri_path("plans"), params, env, headers,nil, false, jsonKeys)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('get', uri_path("plans",id.to_s), {}, env, headers,nil, false, jsonKeys)
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("plans",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys)
  end

  def self.copy(params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("plans","copy"), params, env, headers,nil, false, jsonKeys)
  end

  def self.unarchive(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("plans",id.to_s,"unarchive"), {}, env, headers,nil, false, jsonKeys)
  end

  end # ~Plan
end # ~ChargeBee