module ChargeBee
  class CreditNote < Model

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

    class LinkedRefund < Model
      attr_accessor :txn_id, :applied_amount, :applied_at, :txn_status, :txn_date, :txn_amount
    end

    class Allocation < Model
      attr_accessor :invoice_id, :allocated_amount, :allocated_at, :invoice_date, :invoice_status
    end

  attr_accessor :id, :customer_id, :subscription_id, :reference_invoice_id, :type, :reason_code,
  :status, :vat_number, :date, :price_type, :total, :amount_allocated, :amount_refunded, :amount_available,
  :refunded_at, :sub_total, :currency_code, :line_items, :discounts, :taxes, :line_item_taxes,
  :linked_refunds, :allocations

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("credit_notes",id.to_s), {}, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("credit_notes"), params, env, headers)
  end

  def self.credit_notes_for_customer(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("customers",id.to_s,"credit_notes"), params, env, headers)
  end

  end # ~CreditNote
end # ~ChargeBee