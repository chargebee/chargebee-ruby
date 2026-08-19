module ChargeBee
  class QuoteEntitlement < Model

  attr_accessor :entity_id, :entity_type, :action_type, :feature_id, :value, :is_enabled, :start_date,
  :end_date, :created_at, :modified_at, :is_overridden, :feature_name, :feature_unit, :feature_type,
  :name, :metered

  # OPERATIONS
  #-----------

  def self.list_quote_entitlements(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("quotes",id.to_s,"quote_entitlements"), params, env, headers,nil, false, jsonKeys, options, "quoteEntitlement", "listQuoteEntitlements")
  end

  end # ~QuoteEntitlement
end # ~ChargeBee