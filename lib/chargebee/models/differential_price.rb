module ChargeBee
  class DifferentialPrice < Model

    class Tier < Model
      attr_accessor :starting_unit, :ending_unit, :price, :starting_unit_in_decimal, :ending_unit_in_decimal, :price_in_decimal
    end

    class ParentPeriod < Model
      attr_accessor :period_unit, :period
    end

  attr_accessor :id, :item_price_id, :parent_item_id, :price, :price_in_decimal, :status, :resource_version,
  :updated_at, :created_at, :modified_at, :tiers, :currency_code, :parent_periods

  # OPERATIONS
  #-----------

  def self.create(id, params, env=nil, headers={})
    Request.send('post', uri_path("item_prices",id.to_s,"differential_prices"), params, env, headers)
  end

  def self.retrieve(id, params, env=nil, headers={})
    Request.send('get', uri_path("differential_prices",id.to_s), params, env, headers)
  end

  def self.update(id, params, env=nil, headers={})
    Request.send('post', uri_path("differential_prices",id.to_s), params, env, headers)
  end

  def self.delete(id, params, env=nil, headers={})
    Request.send('post', uri_path("differential_prices",id.to_s,"delete"), params, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("differential_prices"), params, env, headers)
  end

  end # ~DifferentialPrice
end # ~ChargeBee