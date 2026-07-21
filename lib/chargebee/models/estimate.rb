module ChargeBee
  class Estimate < Model

  attr_accessor :created_at, :subscription_estimate, :subscription_estimates, :invoice_estimate,
  :invoice_estimates, :payment_schedule_estimates, :next_invoice_estimate, :credit_note_estimates,
  :unbilled_charge_estimates

  # OPERATIONS
  #-----------

  def self.create_subscription(params, env=nil, headers={})
    jsonKeys = { 
        :exemption_details => 1,
    }
    options = {}
    Request.send('post', uri_path("estimates","create_subscription"), params, env, headers,nil, false, jsonKeys, options, "estimate", "createSubscription")
  end

  def self.create_sub_item_estimate(params, env=nil, headers={})
    jsonKeys = { 
        :exemption_details => 1,
    }
    options = {}
    Request.send('post', uri_path("estimates","create_subscription_for_items"), params, env, headers,nil, false, jsonKeys, options, "estimate", "createSubItemEstimate")
  end

  def self.create_sub_for_customer_estimate(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("customers",id.to_s,"create_subscription_estimate"), params, env, headers,nil, false, jsonKeys, options, "estimate", "createSubForCustomerEstimate")
  end

  def self.create_sub_item_for_customer_estimate(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("customers",id.to_s,"create_subscription_for_items_estimate"), params, env, headers,nil, false, jsonKeys, options, "estimate", "createSubItemForCustomerEstimate")
  end

  def self.update_subscription(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("estimates","update_subscription"), params, env, headers,nil, false, jsonKeys, options, "estimate", "updateSubscription")
  end

  def self.update_subscription_for_items(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("estimates","update_subscription_for_items"), params, env, headers,nil, false, jsonKeys, options, "estimate", "updateSubscriptionForItems")
  end

  def self.renewal_estimate(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("subscriptions",id.to_s,"renewal_estimate"), params, env, headers,nil, false, jsonKeys, options, "estimate", "renewalEstimate")
  end

  def self.advance_invoice_estimate(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("subscriptions",id.to_s,"advance_invoice_estimate"), params, env, headers,nil, false, jsonKeys, options, "estimate", "advanceInvoiceEstimate")
  end

  def self.regenerate_invoice_estimate(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("subscriptions",id.to_s,"regenerate_invoice_estimate"), params, env, headers,nil, false, jsonKeys, options, "estimate", "regenerateInvoiceEstimate")
  end

  def self.upcoming_invoices_estimate(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("customers",id.to_s,"upcoming_invoices_estimate"), params, env, headers,nil, false, jsonKeys, options, "estimate", "upcomingInvoicesEstimate")
  end

  def self.change_term_end(id, params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("subscriptions",id.to_s,"change_term_end_estimate"), params, env, headers,nil, false, jsonKeys, options, "estimate", "changeTermEnd")
  end

  def self.cancel_subscription(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("subscriptions",id.to_s,"cancel_subscription_estimate"), params, env, headers,nil, false, jsonKeys, options, "estimate", "cancelSubscription")
  end

  def self.cancel_subscription_for_items(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("subscriptions",id.to_s,"cancel_subscription_for_items_estimate"), params, env, headers,nil, false, jsonKeys, options, "estimate", "cancelSubscriptionForItems")
  end

  def self.pause_subscription(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("subscriptions",id.to_s,"pause_subscription_estimate"), params, env, headers,nil, false, jsonKeys, options, "estimate", "pauseSubscription")
  end

  def self.resume_subscription(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("subscriptions",id.to_s,"resume_subscription_estimate"), params, env, headers,nil, false, jsonKeys, options, "estimate", "resumeSubscription")
  end

  def self.gift_subscription(params, env=nil, headers={})
    jsonKeys = { 
        :additional_information => 1,
    }
    options = {}
    Request.send('post', uri_path("estimates","gift_subscription"), params, env, headers,nil, false, jsonKeys, options, "estimate", "giftSubscription")
  end

  def self.gift_subscription_for_items(params, env=nil, headers={})
    jsonKeys = { 
        :additional_information => 1,
    }
    options = {}
    Request.send('post', uri_path("estimates","gift_subscription_for_items"), params, env, headers,nil, false, jsonKeys, options, "estimate", "giftSubscriptionForItems")
  end

  def self.create_invoice(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("estimates","create_invoice"), params, env, headers,nil, false, jsonKeys, options, "estimate", "createInvoice")
  end

  def self.create_invoice_for_items(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("estimates","create_invoice_for_items"), params, env, headers,nil, false, jsonKeys, options, "estimate", "createInvoiceForItems")
  end

  def self.payment_schedules(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("estimates","payment_schedules"), params, env, headers,nil, false, jsonKeys, options, "estimate", "paymentSchedules")
  end

  end # ~Estimate
end # ~ChargeBee