module ChargeBee
  class InstallmentConfig < Model

    class Installment < Model
      attr_accessor :period, :amount_percentage
    end

  attr_accessor :id, :description, :number_of_installments, :period_unit, :period, :preferred_day,
  :created_at, :resource_version, :updated_at, :installments

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("installment_configs"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("installment_configs",id.to_s), {}, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("installment_configs",id.to_s,"delete"), {}, env, headers)
  end

  end # ~InstallmentConfig
end # ~ChargeBee