module ChargeBee
  class InvoiceEstimate < Model

    class LineItem < Model
      attr_accessor :date_from, :date_to, :unit_amount, :quantity, :is_taxed, :tax_amount, :tax_rate, :amount, :discount_amount, :item_level_discount_amount, :description, :entity_type, :entity_id
    end

    class Discount < Model
      attr_accessor :amount, :description, :entity_type, :entity_id
    end

    class Tax < Model
      attr_accessor :amount, :description
    end

  attr_accessor :recurring, :price_type, :sub_total, :total, :credits_applied, :amount_paid, :amount_due,
  :line_items, :discounts, :taxes

  # OPERATIONS
  #-----------

  end # ~InvoiceEstimate
end # ~ChargeBee