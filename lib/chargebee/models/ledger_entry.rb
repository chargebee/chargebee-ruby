module ChargeBee
  class LedgerEntry < Model

  attr_accessor :id, :subscription_id, :unit_id, :unit_type, :account_type, :amount, :grant_block_start_balance,
  :grant_block_end_balance, :account_start_balance, :account_end_balance, :type, :ledger_operation_id,
  :grant_block_id, :created_at, :modified_at

  # OPERATIONS
  #-----------

  end # ~LedgerEntry
end # ~ChargeBee