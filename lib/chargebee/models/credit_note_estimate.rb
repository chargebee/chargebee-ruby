module ChargeBee
  class CreditNoteEstimate < Model

    class LineItem < Model
      attr_accessor :date_from, :date_to, :unit_amount, :quantity, :is_taxed, :tax_amount, :tax_rate, :amount, :discount_amount, :item_level_discount_amount, :description, :entity_type, :entity_id
    end

    class Discount < Model
      attr_accessor :amount, :description, :entity_type, :entity_id
    end

    class Tax < Model
      attr_accessor :amount, :description
    end

  attr_accessor :reference_invoice_id, :type, :price_type, :sub_total, :total, :amount_allocated,
  :amount_available, :line_items, :discounts, :taxes

  # OPERATIONS
  #-----------

  end # ~CreditNoteEstimate
end # ~ChargeBee