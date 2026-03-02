module ChargeBee
  class UsageSummary < Model

  attr_accessor :subscription_id, :feature_id, :aggregated_value, :aggregated_from, :aggregated_to

  # OPERATIONS
  #-----------

  # @deprecated This method is deprecated and will be removed in a future version.
  def self.retrieve_usage_summary_for_subscription(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("subscriptions",id.to_s,"usage_summary"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~UsageSummary
end # ~ChargeBee