module ChargeBee
  class InvoiceEstimate < Model

    class LineItem < Model
      attr_accessor :id, :subscription_id, :date_from, :date_to, :unit_amount, :quantity, :amount, :pricing_model, :is_taxed, :tax_amount, :tax_rate, :unit_amount_in_decimal, :quantity_in_decimal, :amount_in_decimal, :discount_amount, :item_level_discount_amount, :description, :entity_description, :entity_type, :tax_exempt_reason, :entity_id, :customer_id
    end

    class Discount < Model
      attr_accessor :amount, :description, :entity_type, :entity_id
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

    class LineItemDiscount < Model
      attr_accessor :line_item_id, :discount_type, :coupon_id, :entity_id, :discount_amount
    end

  attr_accessor :recurring, :price_type, :currency_code, :sub_total, :total, :credits_applied,
  :amount_paid, :amount_due, :line_items, :discounts, :taxes, :line_item_taxes, :line_item_tiers,
  :line_item_discounts, :round_off_amount, :customer_id

  # OPERATIONS
  #-----------

  end # ~InvoiceEstimate
end # ~ChargeBee