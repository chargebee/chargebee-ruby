module ChargeBee
  class CreditNote < Model

    class LineItem < Model
      attr_accessor :id, :subscription_id, :date_from, :date_to, :unit_amount, :quantity, :amount, :pricing_model, :is_taxed, :tax_amount, :tax_rate, :unit_amount_in_decimal, :quantity_in_decimal, :amount_in_decimal, :discount_amount, :item_level_discount_amount, :metered, :is_percentage_pricing, :reference_line_item_id, :description, :entity_description, :entity_type, :tax_exempt_reason, :entity_id, :customer_id
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

    class LineItemAddress < Model
      attr_accessor :line_item_id, :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip, :validation_status
    end

    class Discount < Model
      attr_accessor :amount, :description, :line_item_id, :entity_type, :discount_type, :entity_id, :coupon_set_code
    end

    class Tax < Model
      attr_accessor :name, :amount, :description
    end

    class TaxOrigin < Model
      attr_accessor :country, :registration_number
    end

    class LinkedRefund < Model
      attr_accessor :txn_id, :applied_amount, :applied_at, :txn_status, :txn_date, :txn_amount, :refund_reason_code
    end

    class Allocation < Model
      attr_accessor :invoice_id, :allocated_amount, :allocated_at, :invoice_date, :invoice_status, :tax_application
    end

    class ShippingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip, :validation_status
    end

    class BillingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip, :validation_status
    end

    class Einvoice < Model
      attr_accessor :id, :reference_number, :status, :message
    end

    class SiteDetailsAtCreation < Model
      attr_accessor :timezone, :organization_address
    end

  attr_accessor :id, :customer_id, :subscription_id, :reference_invoice_id, :type, :reason_code,
  :status, :vat_number, :date, :price_type, :currency_code, :total, :amount_allocated, :amount_refunded,
  :amount_available, :refunded_at, :voided_at, :generated_at, :resource_version, :updated_at,
  :channel, :line_items_next_offset, :sub_total, :sub_total_in_local_currency, :total_in_local_currency,
  :local_currency_code, :round_off_amount, :fractional_correction, :line_items, :line_item_tiers,
  :line_item_discounts, :line_item_taxes, :line_item_addresses, :discounts, :taxes, :tax_origin,
  :linked_refunds, :allocations, :deleted, :tax_category, :local_currency_exchange_rate, :create_reason_code,
  :vat_number_prefix, :business_entity_id, :shipping_address, :billing_address, :einvoice, :site_details_at_creation

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_notes"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.retrieve(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("credit_notes",id.to_s), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.pdf(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_notes",id.to_s,"pdf"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.download_einvoice(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("credit_notes",id.to_s,"download_einvoice"), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.refund(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_notes",id.to_s,"refund"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.record_refund(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_notes",id.to_s,"record_refund"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.void_credit_note(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_notes",id.to_s,"void"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("credit_notes"), params, env, headers,nil, false, jsonKeys, options)
  end

  # @deprecated This method is deprecated and will be removed in a future version.
  def self.credit_notes_for_customer(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("customers",id.to_s,"credit_notes"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.delete(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_notes",id.to_s,"delete"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.remove_tax_withheld_refund(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_notes",id.to_s,"remove_tax_withheld_refund"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.resend_einvoice(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_notes",id.to_s,"resend_einvoice"), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.send_einvoice(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_notes",id.to_s,"send_einvoice"), {}, env, headers,nil, false, jsonKeys, options)
  end

  def self.import_credit_note(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("credit_notes","import_credit_note"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~CreditNote
end # ~ChargeBee