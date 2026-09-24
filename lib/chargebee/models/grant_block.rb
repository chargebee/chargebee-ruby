module ChargeBee
  class GrantBlock < Model

    class ProvisionedBlockBalance < Model
      attr_accessor :granted_amount, :total_balance, :usable_balance, :hold_amount, :used_amount, :expired_amount, :rolled_over_amount, :voided_amount
    end

    class OverdraftBlockBalance < Model
      attr_accessor :is_unlimited, :limit, :total_balance, :usable_balance, :used_amount
    end

  attr_accessor :id, :subscription_id, :unit_id, :unit_type, :account_type, :granted_amount, :effective_from,
  :expires_at, :balance, :hold_amount, :used_amount, :expired_amount, :rolled_over_amount, :voided_amount,
  :origin_grant_block_id, :status, :grant_source, :created_at, :modified_at, :resource_version,
  :provisioned_block_balance, :overdraft_block_balance, :metadata

  # OPERATIONS
  #-----------

  def self.list_grant_blocks(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("grant_blocks"), params, env, headers,nil, false, jsonKeys, options, "grantBlock", "listGrantBlocks")
  end

  end # ~GrantBlock
end # ~ChargeBee