module ChargeBee
  class Export < Model

    class Download < Model
      attr_accessor :download_url, :valid_till, :mime_type
    end

  attr_accessor :id, :operation_type, :mime_type, :status, :created_at, :download
def wait_for_export_completion(env = nil, headers={})
  env = env || ChargeBee.default_env
  sleeptime = env.export_sleeptime

  export_final = (1..50).inject(self) do |export|
    break export if export.status != "in_process"
    sleep(sleeptime)
    self.class.retrieve(self.id, env, headers).export
  end

  # sync last fetched one with the current instance
  new_values = export_final.instance_variable_get("@values")
  self.instance_variable_set("@values", new_values)
  self.load(new_values)

  case export_final.status
  when "in_process"
    raise Error.new('Export is taking too long')
  when "failed"
    json_obj = Util.symbolize_keys(JSON.parse(self.error_json))
    raise OperationFailedError.new(json_obj[:http_code], json_obj)
  when "not_enabled", "_unknown"
    raise Error.new("Export status is in wrong state #{self.status}")
  end
end

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("exports",id.to_s), {}, env, headers)
  end

  def self.revenue_recognition(params, env=nil, headers={})
    Request.send('post', uri_path("exports","revenue_recognition"), params, env, headers)
  end

  def self.deferred_revenue(params, env=nil, headers={})
    Request.send('post', uri_path("exports","deferred_revenue"), params, env, headers)
  end

  def self.plans(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","plans"), params, env, headers)
  end

  def self.addons(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","addons"), params, env, headers)
  end

  def self.coupons(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","coupons"), params, env, headers)
  end

  def self.customers(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","customers"), params, env, headers)
  end

  def self.subscriptions(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","subscriptions"), params, env, headers)
  end

  def self.invoices(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","invoices"), params, env, headers)
  end

  def self.credit_notes(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","credit_notes"), params, env, headers)
  end

  def self.transactions(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","transactions"), params, env, headers)
  end

  def self.orders(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","orders"), params, env, headers)
  end

  def self.item_families(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","item_families"), params, env, headers)
  end

  def self.items(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","items"), params, env, headers)
  end

  def self.item_prices(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","item_prices"), params, env, headers)
  end

  def self.attached_items(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","attached_items"), params, env, headers)
  end

  def self.differential_prices(params={}, env=nil, headers={})
    Request.send('post', uri_path("exports","differential_prices"), params, env, headers)
  end

  end # ~Export
end # ~ChargeBee