module ChargeBee
  class Quote < Model

    class LineItem < Model
      attr_accessor :id, :subscription_id, :date_from, :date_to, :unit_amount, :quantity, :amount, :pricing_model, :is_taxed, :tax_amount, :tax_rate, :unit_amount_in_decimal, :quantity_in_decimal, :amount_in_decimal, :discount_amount, :item_level_discount_amount, :description, :entity_description, :entity_type, :tax_exempt_reason, :entity_id, :customer_id
    end

    class Discount < Model
      attr_accessor :amount, :description, :entity_type, :entity_id
    end

    class LineItemDiscount < Model
      attr_accessor :line_item_id, :discount_type, :coupon_id, :entity_id, :discount_amount
    end

    class Tax < Model
      attr_accessor :name, :amount, :description
    end

    class LineItemTax < Model
      attr_accessor :line_item_id, :tax_name, :tax_rate, :is_partial_tax_applied, :is_non_compliance_tax, :taxable_amount, :tax_amount, :tax_juris_type, :tax_juris_name, :tax_juris_code, :tax_amount_in_local_currency, :local_currency_code
    end

    class LineItemTier < Model
      attr_accessor :line_item_id, :starting_unit, :ending_unit, :quantity_used, :unit_amount, :starting_unit_in_decimal, :ending_unit_in_decimal, :quantity_used_in_decimal, :unit_amount_in_decimal
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
  :updated_at, :vat_number_prefix, :line_items, :discounts, :line_item_discounts, :taxes, :line_item_taxes,
  :line_item_tiers, :currency_code, :notes, :shipping_address, :billing_address, :contract_term_start,
  :contract_term_end, :contract_term_termination_fee

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("quotes",id.to_s), {}, env, headers)
  end

  def self.create_sub_for_customer_quote(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"create_subscription_quote"), params, env, headers)
  end

  def self.edit_create_sub_for_customer_quote(id, params, env=nil, headers={})
    Request.send('post', uri_path("quotes",id.to_s,"edit_create_subscription_quote"), params, env, headers)
  end

  def self.update_subscription_quote(params, env=nil, headers={})
    Request.send('post', uri_path("quotes","update_subscription_quote"), params, env, headers)
  end

  def self.edit_update_subscription_quote(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("quotes",id.to_s,"edit_update_subscription_quote"), params, env, headers)
  end

  def self.create_for_onetime_charges(params, env=nil, headers={})
    Request.send('post', uri_path("quotes","create_for_onetime_charges"), params, env, headers)
  end

  def self.edit_one_time_quote(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("quotes",id.to_s,"edit_one_time_quote"), params, env, headers)
  end

  def self.create_sub_items_for_customer_quote(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"create_subscription_quote_for_items"), params, env, headers)
  end

  def self.edit_create_sub_customer_quote_for_items(id, params, env=nil, headers={})
    Request.send('post', uri_path("quotes",id.to_s,"edit_create_subscription_quote_for_items"), params, env, headers)
  end

  def self.update_subscription_quote_for_items(params, env=nil, headers={})
    Request.send('post', uri_path("quotes","update_subscription_quote_for_items"), params, env, headers)
  end

  def self.edit_update_subscription_quote_for_items(id, params, env=nil, headers={})
    Request.send('post', uri_path("quotes",id.to_s,"edit_update_subscription_quote_for_items"), params, env, headers)
  end

  def self.create_for_charge_items_and_charges(params, env=nil, headers={})
    Request.send('post', uri_path("quotes","create_for_charge_items_and_charges"), params, env, headers)
  end

  def self.edit_for_charge_items_and_charges(id, params, env=nil, headers={})
    Request.send('post', uri_path("quotes",id.to_s,"edit_for_charge_items_and_charges"), params, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("quotes"), params, env, headers)
  end

  def self.quote_line_groups_for_quote(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("quotes",id.to_s,"quote_line_groups"), params, env, headers)
  end

  def self.convert(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("quotes",id.to_s,"convert"), params, env, headers)
  end

  def self.update_status(id, params, env=nil, headers={})
    Request.send('post', uri_path("quotes",id.to_s,"update_status"), params, env, headers)
  end

  def self.extend_expiry_date(id, params, env=nil, headers={})
    Request.send('post', uri_path("quotes",id.to_s,"extend_expiry_date"), params, env, headers)
  end

  def self.delete(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("quotes",id.to_s,"delete"), params, env, headers)
  end

  def self.pdf(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("quotes",id.to_s,"pdf"), params, env, headers)
  end

  end # ~Quote
end # ~ChargeBee