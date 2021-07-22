module ChargeBee
  class HostedPage < Model

  attr_accessor :id, :type, :url, :state, :failure_reason, :pass_thru_content, :embed, :created_at,
  :expires_at, :updated_at, :resource_version, :checkout_info

  class Content < Result
  end

  def content
    if @values[:content].nil?
        nil
    else
        Content.new(@values[:content])
    end
  end

  # OPERATIONS
  #-----------

  def self.checkout_new(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","checkout_new"), params, env, headers)
  end

  def self.checkout_one_time(params={}, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","checkout_one_time"), params, env, headers)
  end

  def self.checkout_one_time_for_items(params={}, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","checkout_one_time_for_items"), params, env, headers)
  end

  def self.checkout_new_for_items(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","checkout_new_for_items"), params, env, headers)
  end

  def self.checkout_existing(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","checkout_existing"), params, env, headers)
  end

  def self.checkout_existing_for_items(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","checkout_existing_for_items"), params, env, headers)
  end

  def self.update_card(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","update_card"), params, env, headers)
  end

  def self.update_payment_method(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","update_payment_method"), params, env, headers)
  end

  def self.manage_payment_sources(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","manage_payment_sources"), params, env, headers)
  end

  def self.collect_now(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","collect_now"), params, env, headers)
  end

  def self.accept_quote(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","accept_quote"), params, env, headers)
  end

  def self.extend_subscription(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","extend_subscription"), params, env, headers)
  end

  def self.checkout_gift(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","checkout_gift"), params, env, headers)
  end

  def self.checkout_gift_for_items(params={}, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","checkout_gift_for_items"), params, env, headers)
  end

  def self.claim_gift(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","claim_gift"), params, env, headers)
  end

  def self.retrieve_agreement_pdf(params, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages","retrieve_agreement_pdf"), params, env, headers)
  end

  def self.acknowledge(id, env=nil, headers={})
    Request.send('post', uri_path("hosted_pages",id.to_s,"acknowledge"), {}, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("hosted_pages",id.to_s), {}, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("hosted_pages"), params, env, headers)
  end

  end # ~HostedPage
end # ~ChargeBee