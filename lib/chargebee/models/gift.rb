module ChargeBee
  class Gift < Model

    class Gifter < Model
      attr_accessor :customer_id, :invoice_id, :signature, :note
    end

    class GiftReceiver < Model
      attr_accessor :customer_id, :subscription_id, :first_name, :last_name, :email
    end

    class GiftTimeline < Model
      attr_accessor :status, :occurred_at
    end

  attr_accessor :id, :status, :scheduled_at, :auto_claim, :no_expiry, :claim_expiry_date, :resource_version,
  :updated_at, :gifter, :gift_receiver, :gift_timelines

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("gifts"), params, env, headers)
  end

  def self.create_for_items(params, env=nil, headers={})
    Request.send('post', uri_path("gifts","create_for_items"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("gifts",id.to_s), {}, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("gifts"), params, env, headers)
  end

  def self.claim(id, env=nil, headers={})
    Request.send('post', uri_path("gifts",id.to_s,"claim"), {}, env, headers)
  end

  def self.cancel(id, env=nil, headers={})
    Request.send('post', uri_path("gifts",id.to_s,"cancel"), {}, env, headers)
  end

  def self.update_gift(id, params, env=nil, headers={})
    Request.send('post', uri_path("gifts",id.to_s,"update_gift"), params, env, headers)
  end

  end # ~Gift
end # ~ChargeBee