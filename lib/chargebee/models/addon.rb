module ChargeBee
  class Addon < Model

  attr_accessor :id, :name, :invoice_name, :description, :type, :charge_type, :price, :currency_code,
  :period, :period_unit, :unit, :status, :archived_at, :enabled_in_portal, :tax_code, :sku, :accounting_code,
  :accounting_category1, :accounting_category2, :resource_version, :updated_at, :invoice_notes,
  :taxable, :tax_profile_id, :meta_data

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("addons"), params, env, headers)
  end

  def self.update(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("addons",id.to_s), params, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("addons"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("addons",id.to_s), {}, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("addons",id.to_s,"delete"), {}, env, headers)
  end

  def self.copy(params, env=nil, headers={})
    Request.send('post', uri_path("addons","copy"), params, env, headers)
  end

  end # ~Addon
end # ~ChargeBee