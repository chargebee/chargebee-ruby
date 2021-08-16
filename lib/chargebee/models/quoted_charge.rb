module ChargeBee
  class QuotedCharge < Model

    class Charge < Model
      attr_accessor :amount, :amount_in_decimal, :description, :service_period_in_days, :avalara_sale_type, :avalara_transaction_type, :avalara_service_type
    end

    class Addon < Model
      attr_accessor :id, :quantity, :unit_price, :quantity_in_decimal, :unit_price_in_decimal, :service_period
    end

    class InvoiceItem < Model
      attr_accessor :item_price_id, :quantity, :quantity_in_decimal, :unit_price, :unit_price_in_decimal, :service_period_days
    end

    class ItemTier < Model
      attr_accessor :item_price_id, :starting_unit, :ending_unit, :price, :starting_unit_in_decimal, :ending_unit_in_decimal, :price_in_decimal
    end

    class Coupon < Model
      attr_accessor :coupon_id
    end

  attr_accessor :charges, :addons, :invoice_items, :item_tiers, :coupons

  # OPERATIONS
  #-----------

  end # ~QuotedCharge
end # ~ChargeBee