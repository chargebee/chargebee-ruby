module ChargeBee
  class LedgerAccountBalance < Model

    class ProvisionedBalance < Model
      attr_accessor :total_balance, :usable_balance, :hold_amount
    end

    class OverdraftBalance < Model
      attr_accessor :is_unlimited, :limit, :total_balance, :usable_balance, :used_amount, :hold_amount
    end

  attr_accessor :subscription_id, :unit_id, :unit_type, :modified_at, :provisioned_balance, :overdraft_balance

  # OPERATIONS
  #-----------

  def self.list_ledger_account_balances(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("ledger_account_balances"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~LedgerAccountBalance
end # ~ChargeBee