module ChargeBee
  class HostedPage < Model

  attr_accessor :id, :type, :url, :state, :failure_reason, :pass_thru_content, :embed, :created_at,
  :expires_at, :layout, :updated_at, :resource_version, :checkout_info, :business_entity_id

  class Content < Result
  end

  def content
    if @values[:content].nil?
        nil
    else
        Content.new(@values[:content])
    end
  end

  # OPERATIONS
  #-----------

  def self.checkout_new(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","checkout_new"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "checkoutNew")
  end

  def self.checkout_one_time(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","checkout_one_time"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "checkoutOneTime")
  end

  def self.checkout_one_time_for_items(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","checkout_one_time_for_items"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "checkoutOneTimeForItems")
  end

  def self.checkout_new_for_items(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","checkout_new_for_items"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "checkoutNewForItems")
  end

  def self.checkout_existing(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","checkout_existing"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "checkoutExisting")
  end

  def self.checkout_existing_for_items(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","checkout_existing_for_items"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "checkoutExistingForItems")
  end

  # @deprecated This method is deprecated and will be removed in a future version.
  def self.update_card(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","update_card"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "updateCard")
  end

  # @deprecated This method is deprecated and will be removed in a future version.
  def self.update_payment_method(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","update_payment_method"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "updatePaymentMethod")
  end

  def self.manage_payment_sources(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","manage_payment_sources"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "managePaymentSources")
  end

  def self.collect_now(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","collect_now"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "collectNow")
  end

  def self.accept_quote(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","accept_quote"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "acceptQuote")
  end

  def self.extend_subscription(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","extend_subscription"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "extendSubscription")
  end

  def self.checkout_gift(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","checkout_gift"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "checkoutGift")
  end

  def self.checkout_gift_for_items(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","checkout_gift_for_items"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "checkoutGiftForItems")
  end

  def self.claim_gift(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","claim_gift"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "claimGift")
  end

  def self.retrieve_agreement_pdf(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","retrieve_agreement_pdf"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "retrieveAgreementPdf")
  end

  def self.acknowledge(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages",id.to_s,"acknowledge"), {}, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "acknowledge")
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("hosted_pages",id.to_s), {}, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "retrieve")
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("hosted_pages"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "list")
  end

  def self.pre_cancel(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","pre_cancel"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "preCancel")
  end

  def self.events(params, env=nil, headers={})
    jsonKeys = { 
        :event_data => 0,
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","events"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "events")
  end

  def self.view_voucher(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("hosted_pages","view_voucher"), params, env, headers,nil, false, jsonKeys, options, telemetry_resource: "hostedPage", telemetry_operation: "viewVoucher")
  end

  end # ~HostedPage
end # ~ChargeBee