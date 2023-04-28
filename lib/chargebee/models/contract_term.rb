module ChargeBee
  class ContractTerm < Model

  attr_accessor :id, :status, :contract_start, :contract_end, :billing_cycle, :action_at_term_end,
  :total_contract_value, :total_contract_value_before_tax, :cancellation_cutoff_period, :created_at,
  :subscription_id, :remaining_billing_cycles

  # OPERATIONS
  #-----------

  end # ~ContractTerm
end # ~ChargeBee