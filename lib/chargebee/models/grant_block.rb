module ChargeBee
  class GrantBlock < Model

  attr_accessor :id, :granted_amount, :effective_from, :expires_at, :balance, :hold_amount, :used_amount,
  :expired_amount, :rolled_over_amount, :voided_amount, :origin_grant_block_id, :status, :grant_source,
  :created_at, :account_type, :unit_id, :unit_type, :metadata

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