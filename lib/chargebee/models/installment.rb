module ChargeBee
  class Installment < Model

  attr_accessor :id, :invoice_id, :date, :amount, :status, :created_at, :resource_version, :updated_at

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("installments",id.to_s), {}, env, headers)
  end

  def self.list(params, env=nil, headers={})
    Request.send_list_request('get', uri_path("installments"), params, env, headers)
  end

  end # ~Installment
end # ~ChargeBee