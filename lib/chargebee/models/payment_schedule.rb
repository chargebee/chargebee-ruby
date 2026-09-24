module ChargeBee
  class PaymentSchedule < Model

    class ScheduleEntry < Model
      attr_accessor :id, :date, :amount, :scheduled_amount, :status
    end

    class ReferenceTransaction < Model
      attr_accessor :schedule_entry_id, :applied_amount, :txn_id, :txn_status, :txn_date, :txn_amount
    end

  attr_accessor :id, :scheme_id, :entity_type, :entity_id, :amount, :created_at, :resource_version,
  :updated_at, :currency_code, :schedule_entries, :reference_transactions

  # OPERATIONS
  #-----------

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("payment_schedules"), params, env, headers,nil, false, jsonKeys, options, "paymentSchedule", "list")
  end

  end # ~PaymentSchedule
end # ~ChargeBee