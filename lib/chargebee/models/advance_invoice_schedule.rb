module ChargeBee
  class AdvanceInvoiceSchedule < Model

    class FixedIntervalSchedule < Model
      attr_accessor :end_schedule_on, :number_of_occurrences, :days_before_renewal, :end_date, :created_at, :terms_to_charge
    end

    class SpecificDatesSchedule < Model
      attr_accessor :terms_to_charge, :date, :created_at
    end

  attr_accessor :id, :schedule_type, :fixed_interval_schedule, :specific_dates_schedule

  # OPERATIONS
  #-----------

  end # ~AdvanceInvoiceSchedule
end # ~ChargeBee