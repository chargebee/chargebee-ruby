module ChargeBee
  class UnbilledCharge < Model

    class Tier < Model
      attr_accessor :starting_unit, :ending_unit, :quantity_used, :unit_amount, :starting_unit_in_decimal, :ending_unit_in_decimal, :quantity_used_in_decimal, :unit_amount_in_decimal
    end

  attr_accessor :id, :customer_id, :subscription_id, :date_from, :date_to, :unit_amount, :pricing_model,
  :quantity, :amount, :currency_code, :discount_amount, :description, :entity_type, :entity_id,
  :is_voided, :voided_at, :unit_amount_in_decimal, :quantity_in_decimal, :amount_in_decimal, :tiers,
  :deleted

  # OPERATIONS
  #-----------

  def self.create_unbilled_charge(params, env=nil, headers={})
    Request.send('post', uri_path("unbilled_charges","create"), params, env, headers)
  end

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("unbilled_charges"), params, env, headers)
  end

  def self.invoice_unbilled_charges(params={}, env=nil, headers={})
    Request.send('post', uri_path("unbilled_charges","invoice_unbilled_charges"), params, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("unbilled_charges",id.to_s,"delete"), {}, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("unbilled_charges"), params, env, headers)
  end

  def self.invoice_now_estimate(params={}, env=nil, headers={})
    Request.send('post', uri_path("unbilled_charges","invoice_now_estimate"), params, env, headers)
  end

  end # ~UnbilledCharge
end # ~ChargeBee