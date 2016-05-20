module ChargeBee
  class CreditNoteEstimate < Model

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

  attr_accessor :reference_invoice_id, :type, :price_type, :sub_total, :total, :amount_allocated,
  :amount_available, :line_items, :discounts, :taxes, :line_item_taxes

  # OPERATIONS
  #-----------

  end # ~CreditNoteEstimate
end # ~ChargeBee