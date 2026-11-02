module ChargeBee
  class CollectionsDispute < Model

  attr_accessor :id, :customer_id, :invoice_id, :line_item_id, :currency_code, :billed_amount,
  :claimed_deduction, :status, :dispute_reason_code, :resolved_reason_code, :reason, :opened_at,
  :resolved_at, :created_at, :updated_at, :resource_version, :undisputed_amount

  # OPERATIONS
  #-----------

  end # ~CollectionsDispute
end # ~ChargeBee