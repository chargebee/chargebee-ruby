module ChargeBee
  class PaymentScheduleEstimate < Model

    class ScheduleEntry < Model
      attr_accessor :id, :date, :amount, :status
    end

  attr_accessor :id, :scheme_id, :entity_type, :entity_id, :amount, :currency_code, :schedule_entries

  # OPERATIONS
  #-----------

  end # ~PaymentScheduleEstimate
end # ~ChargeBee