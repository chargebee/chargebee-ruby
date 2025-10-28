module ChargeBee
  class PaymentIntent < Model

    class PaymentAttempt < Model
      attr_accessor :id, :status, :payment_method_type, :id_at_gateway, :error_code, :error_text, :checkout_details, :created_at, :modified_at, :error_detail
    end

    class PaymentAttempt < Model
      attr_accessor :id, :status, :payment_method_type, :id_at_gateway, :error_code, :error_text, :checkout_details, :created_at, :modified_at, :error_detail
    end

  attr_accessor :id, :status, :currency_code, :amount, :gateway_account_id, :expires_at, :reference_id,
  :payment_method_type, :success_url, :failure_url, :created_at, :modified_at, :resource_version,
  :updated_at, :customer_id, :gateway, :active_payment_attempt, :payment_attempts, :business_entity_id

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("payment_intents"), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.update(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("payment_intents",id.to_s), params, env, headers,nil, false, jsonKeys, options)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("payment_intents",id.to_s), {}, env, headers,nil, false, jsonKeys, options)
  end

  end # ~PaymentIntent
end # ~ChargeBee