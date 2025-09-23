module ChargeBee
  class OmnichannelSubscriptionItem < Model

    class UpcomingRenewal < Model
      attr_accessor :price_currency, :price_units, :price_nanos
    end

    class LinkedItem < Model
      attr_accessor :id, :linked_at
    end

  attr_accessor :id, :item_id_at_source, :item_parent_id_at_source, :status, :auto_renew_status,
  :current_term_start, :current_term_end, :expired_at, :expiration_reason, :cancelled_at, :cancellation_reason,
  :grace_period_expires_at, :resumes_at, :has_scheduled_changes, :resource_version, :omnichannel_subscription_item_offers,
  :upcoming_renewal, :linked_item

  # OPERATIONS
  #-----------

  def self.list_omni_sub_item_schedule_changes(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("omnichannel_subscription_items",id.to_s,"scheduled_changes"), params, env, headers,nil, false, jsonKeys, options)
  end

  end # ~OmnichannelSubscriptionItem
end # ~ChargeBee