module ChargeBee
  class InvoiceEstimate < Model

    class LineItem < Model
      attr_accessor :id, :date_from, :date_to, :unit_amount, :quantity, :is_taxed, :tax_amount, :tax_rate, :amount, :discount_amount, :item_level_discount_amount, :description, :entity_type, :entity_id
    end

    class Discount < Model
      attr_accessor :amount, :description, :entity_type, :entity_id
    end

    class Tax < Model
      attr_accessor :name, :amount, :description
    end

    class LineItemTax < Model
      attr_accessor :line_item_id, :tax_name, :tax_rate, :tax_amount, :tax_juris_type, :tax_juris_name, :tax_juris_code
    end

  attr_accessor :recurring, :price_type, :currency_code, :sub_total, :total, :credits_applied,
  :amount_paid, :amount_due, :line_items, :discounts, :taxes, :line_item_taxes

  # OPERATIONS
  #-----------

  end # ~InvoiceEstimate
end # ~ChargeBee