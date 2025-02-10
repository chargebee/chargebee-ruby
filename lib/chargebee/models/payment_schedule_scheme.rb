module ChargeBee
  class PaymentScheduleScheme < Model

    class PreferredSchedule < Model
      attr_accessor :period, :amount_percentage
    end

  attr_accessor :id, :name, :description, :number_of_schedules, :period_unit, :period, :created_at,
  :resource_version, :updated_at, :preferred_schedules

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("payment_schedule_schemes"), params, env, headers,nil, false, jsonKeys)
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('get', uri_path("payment_schedule_schemes",id.to_s), {}, env, headers,nil, false, jsonKeys)
  end

  def self.delete(id, env=nil, headers={})
    jsonKeys = { 
    }
    Request.send('post', uri_path("payment_schedule_schemes",id.to_s,"delete"), {}, env, headers,nil, false, jsonKeys)
  end

  end # ~PaymentScheduleScheme
end # ~ChargeBee