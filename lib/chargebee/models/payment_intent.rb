module ChargeBee
  class PaymentIntent < Model

    class PaymentAttempt < Model
      attr_accessor :id, :status, :payment_method_type, :id_at_gateway, :error_code, :error_text, :created_at, :modified_at
    end

  attr_accessor :id, :status, :currency_code, :amount, :gateway_account_id, :expires_at, :reference_id,
  :payment_method_type, :success_url, :failure_url, :created_at, :modified_at, :resource_version,
  :updated_at, :customer_id, :gateway, :active_payment_attempt

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("payment_intents"), params, env, headers)
  end

  def self.update(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("payment_intents",id.to_s), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("payment_intents",id.to_s), {}, env, headers)
  end

  end # ~PaymentIntent
end # ~ChargeBee