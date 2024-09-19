module ChargeBee
  class PaymentSchedule < Model

    class ScheduleEntry < Model
      attr_accessor :id, :date, :amount, :status
    end

  attr_accessor :id, :scheme_id, :entity_type, :entity_id, :amount, :created_at, :resource_version,
  :updated_at, :currency_code, :schedule_entries

  # OPERATIONS
  #-----------

  end # ~PaymentSchedule
end # ~ChargeBee