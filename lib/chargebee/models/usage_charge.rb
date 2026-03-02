module ChargeBee
  class UsageCharge < Model

  attr_accessor :subscription_id, :feature_id, :included_usage, :total_usage, :on_demand_usage,
  :metered_item_price_id, :amount, :currency_code, :usage_from, :usage_to

  # OPERATIONS
  #-----------

  # @deprecated This method is deprecated and will be removed in a future version.
  def self.retrieve_usage_charges_for_subscription(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("subscriptions",id.to_s,"usage_charges"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~UsageCharge
end # ~ChargeBee