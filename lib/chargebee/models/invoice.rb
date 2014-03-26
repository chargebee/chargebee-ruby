module ChargeBee
  class Invoice < Model

    class LineItem < Model
      attr_accessor :date_from, :date_to, :unit_amount, :quantity, :tax, :tax_rate, :amount, :description, :type, :entity_type, :entity_id
    end

    class Discount < Model
      attr_accessor :amount, :description, :type, :entity_id
    end

    class Tax < Model
      attr_accessor :amount, :description
    end

    class LinkedTransaction < Model
      attr_accessor :txn_id, :applied_amount, :txn_type, :txn_status, :txn_date, :txn_amount
    end

  attr_accessor :id, :subscription_id, :recurring, :status, :vat_number, :start_date, :end_date,
  :amount, :paid_on, :next_retry, :sub_total, :tax, :line_items, :discounts, :taxes, :linked_transactions

  # OPERATIONS
  #-----------
    
  def self.charge(params, env=nil)
    Request.send('post', "/invoices/charge", params, env)
  end    

  def self.charge_addon(params, env=nil)
    Request.send('post', "/invoices/charge_addon", params, env)
  end    

  def self.list(params={}, env=nil)
    Request.send('get', "/invoices", params, env)
  end    

  def self.invoices_for_subscription(id, params={}, env=nil)
    Request.send('get', "/subscriptions/#{id.to_s}/invoices", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/invoices/#{id.to_s}", {}, env)
  end    

  def self.pdf(id, env=nil)
    Request.send('post', "/invoices/#{id.to_s}/pdf", {}, env)
  end    

  def self.add_charge(id, params, env=nil)
    Request.send('post', "/invoices/#{id.to_s}/add_charge", params, env)
  end    

  def self.add_addon_charge(id, params, env=nil)
    Request.send('post', "/invoices/#{id.to_s}/add_addon_charge", params, env)
  end    

  def self.collect(id, env=nil)
    Request.send('post', "/invoices/#{id.to_s}/collect", {}, env)
  end    

  def self.refund(id, params={}, env=nil)
    Request.send('post', "/invoices/#{id.to_s}/refund", params, env)
  end    

  end # ~Invoice
end # ~ChargeBee    