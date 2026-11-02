module ChargeBee
  class CollectionsPaymentPromise < Model

  attr_accessor :id, :customer_id, :invoice_id, :status, :reason, :promised_by, :promised_on,
  :created_at, :updated_at, :resource_version

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("collections_payment_promises",id.to_s), {}, env, headers,nil, false, jsonKeys, options, "collectionsPaymentPromise", "retrieve")
  end

  def self.list_collections_payment_promises(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("collections_payment_promises"), params, env, headers,nil, false, jsonKeys, options, "collectionsPaymentPromise", "listCollectionsPaymentPromises")
  end

  def self.create_collections_payment_promise(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("collections_payment_promises"), params, env, headers,nil, false, jsonKeys, options, "collectionsPaymentPromise", "createCollectionsPaymentPromise")
  end

  def self.update_collections_payment_promise(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("collections_payment_promises",id.to_s), params, env, headers,nil, false, jsonKeys, options, "collectionsPaymentPromise", "updateCollectionsPaymentPromise")
  end

  def self.cancel(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("collections_payment_promises",id.to_s,"cancel"), {}, env, headers,nil, false, jsonKeys, options, "collectionsPaymentPromise", "cancel")
  end

  end # ~CollectionsPaymentPromise
end # ~ChargeBee