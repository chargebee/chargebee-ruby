module ChargeBee
  class Alert < Model

  attr_accessor :id, :type, :name, :description, :metered_feature_id, :subscription_id, :status,
  :alarm_triggered_at, :scope, :meta, :created_at, :updated_at

  # OPERATIONS
  #-----------

  end # ~Alert
end # ~ChargeBee