module ChargeBee
  class EmailLog < Model

  attr_accessor :id, :template_name, :from_address, :to_address, :subject, :status, :sent_on,
  :customer_id, :site_id, :business_entity_id, :brand_id, :error_message

  # OPERATIONS
  #-----------

  def self.email_logs_for_customer(id, params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("customers",id.to_s,"email_logs"), params, env, headers,nil, false, jsonKeys, options, "emailLog", "emailLogsForCustomer")
  end

  end # ~EmailLog
end # ~ChargeBee