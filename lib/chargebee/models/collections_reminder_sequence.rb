module ChargeBee
  class CollectionsReminderSequence < Model

    class ActionLog < Model
      attr_accessor :action_type, :status, :reason_code, :executed_at, :scheduled_at
    end

  attr_accessor :id, :invoice_id, :customer_id, :status, :paused_until, :pause_note, :started_at,
  :completed_at, :created_at, :updated_at, :resource_version, :action_logs

  # OPERATIONS
  #-----------

  end # ~CollectionsReminderSequence
end # ~ChargeBee