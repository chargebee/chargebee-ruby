module ChargeBee
  class OmnichannelSubscriptionItem < Model

    class UpcomingRenewal < Model
      attr_accessor :price_currency, :price_units, :price_nanos
    end

  attr_accessor :id, :item_id_at_source, :item_parent_id_at_source, :status, :auto_renew_status,
  :current_term_start, :current_term_end, :expired_at, :expiration_reason, :cancelled_at, :cancellation_reason,
  :grace_period_expires_at, :has_scheduled_changes, :resource_version, :upcoming_renewal

  # OPERATIONS
  #-----------

  def self.list_omni_sub_item_schedule_changes(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('get', uri_path("omnichannel_subscription_items",id.to_s,"scheduled_changes"), params, env, headers,nil, false, jsonKeys)
  end

  end # ~OmnichannelSubscriptionItem
end # ~ChargeBee