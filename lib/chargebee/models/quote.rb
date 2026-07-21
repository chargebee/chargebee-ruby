module ChargeBee
  class Quote < Model

    class LineItem < Model
      attr_accessor :id, :subscription_id, :date_from, :date_to, :unit_amount, :quantity, :amount, :pricing_model, :is_taxed, :tax_amount, :tax_rate, :unit_amount_in_decimal, :quantity_in_decimal, :amount_in_decimal, :discount_amount, :item_level_discount_amount, :metered, :is_percentage_pricing, :reference_line_item_id, :description, :entity_description, :entity_type, :tax_exempt_reason, :entity_id, :customer_id, :proration_mode
    end

    class LineItemTier < Model
      attr_accessor :line_item_id, :starting_unit, :ending_unit, :quantity_used, :unit_amount, :starting_unit_in_decimal, :ending_unit_in_decimal, :quantity_used_in_decimal, :unit_amount_in_decimal, :pricing_type, :package_size
    end

    class LineItemDiscount < Model
      attr_accessor :line_item_id, :discount_type, :coupon_id, :entity_id, :discount_amount
    end

    class LineItemTax < Model
      attr_accessor :line_item_id, :tax_name, :tax_rate, :date_to, :date_from, :prorated_taxable_amount, :is_partial_tax_applied, :is_non_compliance_tax, :taxable_amount, :tax_amount, :tax_juris_type, :tax_juris_name, :tax_juris_code, :tax_amount_in_local_currency, :local_currency_code
    end

    class Discount < Model
      attr_accessor :amount, :description, :line_item_id, :entity_type, :discount_type, :entity_id, :coupon_set_code
    end

    class Tax < Model
      attr_accessor :name, :amount, :description
    end

    class ShippingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip, :validation_status
    end

    class BillingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip, :validation_status
    end

  attr_accessor :id, :name, :po_number, :customer_id, :subscription_id, :invoice_id, :status,
  :operation_type, :vat_number, :price_type, :valid_till, :date, :total_payable, :charge_on_acceptance,
  :sub_total, :total, :credits_applied, :amount_paid, :amount_due, :version, :resource_version,
  :updated_at, :vat_number_prefix, :line_items, :line_item_tiers, :line_item_discounts, :line_item_taxes,
  :discounts, :taxes, :tax_category, :currency_code, :notes, :shipping_address, :billing_address,
  :contract_term_start, :contract_term_end, :contract_term_termination_fee, :business_entity_id,
  :deleted, :total_contract_value, :total_discount

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("quotes",id.to_s), {}, env, headers,nil, false, jsonKeys, options, "quote", "retrieve")
  end

  def self.create_sub_for_customer_quote(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("customers",id.to_s,"create_subscription_quote"), params, env, headers,nil, false, jsonKeys, options, "quote", "createSubForCustomerQuote")
  end

  def self.edit_create_sub_for_customer_quote(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"edit_create_subscription_quote"), params, env, headers,nil, false, jsonKeys, options, "quote", "editCreateSubForCustomerQuote")
  end

  def self.update_subscription_quote(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes","update_subscription_quote"), params, env, headers,nil, false, jsonKeys, options, "quote", "updateSubscriptionQuote")
  end

  def self.edit_update_subscription_quote(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"edit_update_subscription_quote"), params, env, headers,nil, false, jsonKeys, options, "quote", "editUpdateSubscriptionQuote")
  end

  def self.create_for_onetime_charges(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes","create_for_onetime_charges"), params, env, headers,nil, false, jsonKeys, options, "quote", "createForOnetimeCharges")
  end

  def self.edit_one_time_quote(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"edit_one_time_quote"), params, env, headers,nil, false, jsonKeys, options, "quote", "editOneTimeQuote")
  end

  def self.create_sub_items_for_customer_quote(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("customers",id.to_s,"create_subscription_quote_for_items"), params, env, headers,nil, false, jsonKeys, options, "quote", "createSubItemsForCustomerQuote")
  end

  def self.edit_create_sub_customer_quote_for_items(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"edit_create_subscription_quote_for_items"), params, env, headers,nil, false, jsonKeys, options, "quote", "editCreateSubCustomerQuoteForItems")
  end

  def self.update_subscription_quote_for_items(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes","update_subscription_quote_for_items"), params, env, headers,nil, false, jsonKeys, options, "quote", "updateSubscriptionQuoteForItems")
  end

  def self.edit_update_subscription_quote_for_items(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"edit_update_subscription_quote_for_items"), params, env, headers,nil, false, jsonKeys, options, "quote", "editUpdateSubscriptionQuoteForItems")
  end

  def self.create_for_charge_items_and_charges(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes","create_for_charge_items_and_charges"), params, env, headers,nil, false, jsonKeys, options, "quote", "createForChargeItemsAndCharges")
  end

  def self.edit_for_charge_items_and_charges(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"edit_for_charge_items_and_charges"), params, env, headers,nil, false, jsonKeys, options, "quote", "editForChargeItemsAndCharges")
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("quotes"), params, env, headers,nil, false, jsonKeys, options, "quote", "list")
  end

  def self.quote_line_groups_for_quote(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("quotes",id.to_s,"quote_line_groups"), params, env, headers,nil, false, jsonKeys, options, "quote", "quoteLineGroupsForQuote")
  end

  def self.convert(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"convert"), params, env, headers,nil, false, jsonKeys, options, "quote", "convert")
  end

  def self.update_status(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"update_status"), params, env, headers,nil, false, jsonKeys, options, "quote", "updateStatus")
  end

  def self.extend_expiry_date(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"extend_expiry_date"), params, env, headers,nil, false, jsonKeys, options, "quote", "extendExpiryDate")
  end

  def self.delete(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"delete"), params, env, headers,nil, false, jsonKeys, options, "quote", "delete")
  end

  def self.pdf(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"pdf"), params, env, headers,nil, false, jsonKeys, options, "quote", "pdf")
  end

  # @deprecated This method is deprecated and will be removed in a future version.
  def self.retrieve_signature(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("quotes",id.to_s,"retrieve_signature"), {}, env, headers,nil, false, jsonKeys, options, "quote", "retrieveSignature")
  end

  # @deprecated This method is deprecated and will be removed in a future version.
  def self.retrieve_signed_pdf(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"retrieve_signed_pdf"), {}, env, headers,nil, false, jsonKeys, options, "quote", "retrieveSignedPdf")
  end

  # @deprecated This method is deprecated and will be removed in a future version.
  def self.create_signature(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"create_signature"), {}, env, headers,nil, false, jsonKeys, options, "quote", "createSignature")
  end

  # @deprecated This method is deprecated and will be removed in a future version.
  def self.update_signature(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"update_signature"), {}, env, headers,nil, false, jsonKeys, options, "quote", "updateSignature")
  end

  # @deprecated This method is deprecated and will be removed in a future version.
  def self.update_signature_status(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"update_signature_status"), params, env, headers,nil, false, jsonKeys, options, "quote", "updateSignatureStatus")
  end

  # @deprecated This method is deprecated and will be removed in a future version.
  def self.refresh_signature_link(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("quotes",id.to_s,"refresh_signature_link"), {}, env, headers,nil, false, jsonKeys, options, "quote", "refreshSignatureLink")
  end

  end # ~Quote
end # ~ChargeBee