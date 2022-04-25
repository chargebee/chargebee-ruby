module ChargeBee
  class Item < Model

    class ApplicableItem < Model
      attr_accessor :id
    end

  attr_accessor :id, :name, :external_name, :description, :status, :resource_version, :updated_at,
  :item_family_id, :type, :is_shippable, :is_giftable, :redirect_url, :enabled_for_checkout, :enabled_in_portal,
  :included_in_mrr, :item_applicability, :gift_claim_redirect_url, :unit, :metered, :usage_calculation,
  :archived_at, :channel, :applicable_items, :metadata

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("items"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("items",id.to_s), {}, env, headers)
  end

  def self.update(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("items",id.to_s), params, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("items"), params, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("items",id.to_s,"delete"), {}, env, headers)
  end

  end # ~Item
end # ~ChargeBee