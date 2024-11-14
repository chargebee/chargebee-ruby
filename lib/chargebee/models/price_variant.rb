module ChargeBee
  class PriceVariant < Model

    class Attribute < Model
      attr_accessor :name, :value
    end

  attr_accessor :id, :name, :external_name, :variant_group, :description, :status, :created_at,
  :resource_version, :updated_at, :archived_at, :attributes, :business_entity_id

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("price_variants"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("price_variants",id.to_s), {}, env, headers)
  end

  def self.update(id, params, env=nil, headers={})
    Request.send('post', uri_path("price_variants",id.to_s), params, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("price_variants",id.to_s,"delete"), {}, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("price_variants"), params, env, headers)
  end

  end # ~PriceVariant
end # ~ChargeBee