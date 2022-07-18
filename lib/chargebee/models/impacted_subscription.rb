module ChargeBee
  class ImpactedSubscription < Model

    class Download < Model
      attr_accessor :download_url, :valid_till, :mime_type
    end

  attr_accessor :count, :download, :subscription_ids

  # OPERATIONS
  #-----------

  end # ~ImpactedSubscription
end # ~ChargeBee