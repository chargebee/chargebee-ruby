module ChargeBee
  class InstallmentDetail < Model

    class Installment < Model
      attr_accessor :id, :invoice_id, :date, :amount, :status, :created_at, :resource_version, :updated_at
    end

  attr_accessor :id, :invoice_id, :amount, :installments

  # OPERATIONS
  #-----------

  end # ~InstallmentDetail
end # ~ChargeBee