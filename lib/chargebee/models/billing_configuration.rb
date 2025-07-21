module ChargeBee
  class BillingConfiguration < Model

    class BillingDate < Model
      attr_accessor :start_date, :end_date
    end

  attr_accessor :is_calendar_billing_enabled, :billing_dates

  # OPERATIONS
  #-----------

  end # ~BillingConfiguration
end # ~ChargeBee