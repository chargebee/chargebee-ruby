module ChargeBee
  class Order < Model

    class OrderLineItem < Model
      attr_accessor :id, :invoice_id, :invoice_line_item_id, :unit_price, :description, :amount, :fulfillment_quantity, :fulfillment_amount, :tax_amount, :amount_paid, :amount_adjusted, :refundable_credits_issued, :refundable_credits, :is_shippable, :sku, :status, :entity_type, :item_level_discount_amount, :discount_amount, :entity_id
    end

    class ShippingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip, :validation_status
    end

    class BillingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip, :validation_status
    end

    class LineItemTax < Model
      attr_accessor :line_item_id, :tax_name, :tax_rate, :is_partial_tax_applied, :is_non_compliance_tax, :taxable_amount, :tax_amount, :tax_juris_type, :tax_juris_name, :tax_juris_code, :tax_amount_in_local_currency, :local_currency_code
    end

    class LineItemDiscount < Model
      attr_accessor :line_item_id, :discount_type, :coupon_id, :entity_id, :discount_amount
    end

    class LinkedCreditNote < Model
      attr_accessor :amount, :type, :id, :status, :amount_adjusted, :amount_refunded
    end

    class ResentOrder < Model
      attr_accessor :order_id, :reason, :amount
    end

  attr_accessor :id, :document_number, :invoice_id, :subscription_id, :customer_id, :status, :cancellation_reason,
  :payment_status, :order_type, :price_type, :reference_id, :fulfillment_status, :order_date,
  :shipping_date, :note, :tracking_id, :tracking_url, :batch_id, :created_by, :shipment_carrier,
  :invoice_round_off_amount, :tax, :amount_paid, :amount_adjusted, :refundable_credits_issued,
  :refundable_credits, :rounding_adjustement, :paid_on, :shipping_cut_off_date, :created_at, :status_update_at,
  :delivered_at, :shipped_at, :resource_version, :updated_at, :cancelled_at, :resent_status, :is_resent,
  :original_order_id, :order_line_items, :shipping_address, :billing_address, :discount, :sub_total,
  :total, :line_item_taxes, :line_item_discounts, :linked_credit_notes, :deleted, :currency_code,
  :is_gifted, :gift_note, :gift_id, :resend_reason, :resent_orders

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("orders"), params, env, headers)
  end

  def self.update(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("orders",id.to_s), params, env, headers)
  end

  def self.import_order(params, env=nil, headers={})
    Request.send('post', uri_path("orders","import_order"), params, env, headers)
  end

  def self.assign_order_number(id, env=nil, headers={})
    Request.send('post', uri_path("orders",id.to_s,"assign_order_number"), {}, env, headers)
  end

  def self.cancel(id, params, env=nil, headers={})
    Request.send('post', uri_path("orders",id.to_s,"cancel"), params, env, headers)
  end

  def self.create_refundable_credit_note(id, params, env=nil, headers={})
    Request.send('post', uri_path("orders",id.to_s,"create_refundable_credit_note"), params, env, headers)
  end

  def self.reopen(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("orders",id.to_s,"reopen"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("orders",id.to_s), {}, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("orders",id.to_s,"delete"), {}, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("orders"), params, env, headers)
  end

  def self.orders_for_invoice(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("invoices",id.to_s,"orders"), params, env, headers)
  end

  def self.resend(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("orders",id.to_s,"resend"), params, env, headers)
  end

  end # ~Order
end # ~ChargeBee