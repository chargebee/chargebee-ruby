module ChargeBee
  class Token < Model

  attr_accessor :id, :gateway, :gateway_account_id, :payment_method_type, :status, :id_at_vault,
  :vault, :ip_address, :created_at, :expired_at

  # OPERATIONS
  #-----------

  end # ~Token
end # ~ChargeBee