module ChargeBee
  class Estimate < Model

    class LineItem < Model
      attr_accessor :date_from, :date_to, :unit_amount, :quantity, :tax, :tax_rate, :amount, :description, :type, :entity_type, :entity_id
    end

    class Discount < Model
      attr_accessor :amount, :description, :type, :entity_id
    end

    class Tax < Model
      attr_accessor :amount, :description
    end

  attr_accessor :created_at, :recurring, :subscription_id, :subscription_status, :term_ends_at,
  :collect_now, :amount, :sub_total, :line_items, :discounts, :taxes

  # OPERATIONS
  #-----------
    
  def self.create_subscription(params, env=nil)
    Request.send('post', "/estimates/create_subscription", params, env)
  end    

  def self.update_subscription(params, env=nil)
    Request.send('post', "/estimates/update_subscription", params, env)
  end    

  end # ~Estimate
end # ~ChargeBee    