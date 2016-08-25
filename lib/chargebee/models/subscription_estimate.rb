module ChargeBee
  class SubscriptionEstimate < Model

    class ShippingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip, :validation_status
    end

  attr_accessor :id, :currency_code, :status, :next_billing_at, :shipping_address

  # OPERATIONS
  #-----------

  end # ~SubscriptionEstimate
end # ~ChargeBee