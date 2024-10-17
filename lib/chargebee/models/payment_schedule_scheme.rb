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
    Request.send('post', uri_path("payment_schedule_schemes"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("payment_schedule_schemes",id.to_s), {}, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("payment_schedule_schemes",id.to_s,"delete"), {}, env, headers)
  end

  end # ~PaymentScheduleScheme
end # ~ChargeBee