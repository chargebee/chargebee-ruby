module ChargeBee
  class TimeMachine < Model

  attr_accessor :name, :time_travel_status, :genesis_time, :destination_time, :failure_code, :failure_reason,
  :error_json
  def wait_for_time_travel_completion(env = nil)
    env = env || ChargeBee.default_env
    sleeptime = env.time_machine_sleeptime

    tm = (1..30).inject(self) do |time_machine|
      break time_machine if time_machine.time_travel_status != "in_progress"
      sleep(sleeptime)
      self.class.retrieve(self.name, env).time_machine
    end

    # sync last fetched one with the current instance
    new_values = tm.instance_variable_get("@values")
    self.instance_variable_set("@values", new_values)
    self.load(new_values)

    case tm.time_travel_status
    when "in_progress"
      raise Error.new('The time travel is taking too much time')
    when "failed"
      json_obj = Util.symbolize_keys(JSON.parse(self.error_json))
      raise OperationFailedError.new(json_obj[:http_code], json_obj)
    when "not_enabled", "_unknown"
      raise Error.new("Time travel status is in wrong state #{self.time_travel_status}")
    end
  end
  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("time_machines",id.to_s), {}, env, headers)
  end

  def self.start_afresh(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("time_machines",id.to_s,"start_afresh"), params, env, headers)
  end

  def self.travel_forward(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("time_machines",id.to_s,"travel_forward"), params, env, headers)
  end

  end # ~TimeMachine
end # ~ChargeBee