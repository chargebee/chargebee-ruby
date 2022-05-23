require File.dirname(__FILE__) + '/chargebee/environment'
require File.dirname(__FILE__) + '/chargebee/rest'
require File.dirname(__FILE__) + '/chargebee/util'
require File.dirname(__FILE__) + '/chargebee/request'
require File.dirname(__FILE__) + '/chargebee/result'
require File.dirname(__FILE__) + '/chargebee/list_result'

require File.dirname(__FILE__) + '/chargebee/errors'

require File.dirname(__FILE__) + '/chargebee/models/model'
require File.dirname(__FILE__) + '/chargebee/models/subscription'
require File.dirname(__FILE__) + '/chargebee/models/customer'
require File.dirname(__FILE__) + '/chargebee/models/card'
require File.dirname(__FILE__) + '/chargebee/models/third_party_payment_method'
require File.dirname(__FILE__) + '/chargebee/models/address'
require File.dirname(__FILE__) + '/chargebee/models/transaction'
require File.dirname(__FILE__) + '/chargebee/models/invoice'
require File.dirname(__FILE__) + '/chargebee/models/order'
require File.dirname(__FILE__) + '/chargebee/models/credit_note'
require File.dirname(__FILE__) + '/chargebee/models/estimate'
require File.dirname(__FILE__) + '/chargebee/models/subscription_estimate'
require File.dirname(__FILE__) + '/chargebee/models/invoice_estimate'
require File.dirname(__FILE__) + '/chargebee/models/credit_note_estimate'
require File.dirname(__FILE__) + '/chargebee/models/hosted_page'
require File.dirname(__FILE__) + '/chargebee/models/event'
require File.dirname(__FILE__) + '/chargebee/models/plan'
require File.dirname(__FILE__) + '/chargebee/models/addon'
require File.dirname(__FILE__) + '/chargebee/models/coupon'
require File.dirname(__FILE__) + '/chargebee/models/coupon_code'
require File.dirname(__FILE__) + '/chargebee/models/coupon_set'
require File.dirname(__FILE__) + '/chargebee/models/comment'
require File.dirname(__FILE__) + '/chargebee/models/portal_session'
require File.dirname(__FILE__) + '/chargebee/models/download'
require File.dirname(__FILE__) + '/chargebee/models/site_migration_detail'
require File.dirname(__FILE__) + '/chargebee/models/resource_migration'
require File.dirname(__FILE__) + '/chargebee/models/payment_source'
require File.dirname(__FILE__) + '/chargebee/models/unbilled_charge'
require File.dirname(__FILE__) + '/chargebee/models/time_machine'
require File.dirname(__FILE__) + '/chargebee/models/promotional_credit.rb'
require File.dirname(__FILE__) + '/chargebee/models/virtual_bank_account.rb'
require File.dirname(__FILE__) + '/chargebee/models/export'
require File.dirname(__FILE__) + '/chargebee/models/gift'
require File.dirname(__FILE__) + '/chargebee/models/quote'
require File.dirname(__FILE__) + '/chargebee/models/contact.rb'
require File.dirname(__FILE__) + '/chargebee/models/hierarchy.rb'
require File.dirname(__FILE__) + '/chargebee/models/payment_intent.rb'
require File.dirname(__FILE__) + '/chargebee/models/attached_item.rb'
require File.dirname(__FILE__) + '/chargebee/models/differential_price.rb'
require File.dirname(__FILE__) + '/chargebee/models/item.rb'
require File.dirname(__FILE__) + '/chargebee/models/item_family.rb'
require File.dirname(__FILE__) + '/chargebee/models/item_price.rb'
require File.dirname(__FILE__) + '/chargebee/models/usage.rb'

module ChargeBee

  VERSION = '2.16.0'

  @@default_env = nil
  @@verify_ca_certs = true
  @@ca_cert_path = File.join(File.dirname(__FILE__), '/ssl/ca-certs.crt')
  @@user_agent = "Chargebee-Ruby-Client v#{self::VERSION}"

  def self.configure(options)
    @@default_env = Environment.new(options)
  end

  def self.default_env
    @@default_env
  end

  def self.verify_ca_certs=(verify)
    @@verify_ca_certs = verify
  end

  def self.verify_ca_certs?
    @@verify_ca_certs
  end

  def self.ca_cert_path
    @@ca_cert_path
  end


  def self.source(source)
    @@user_agent = @@user_agent + ' ' + source unless source.nil?
  end

  def self.user_agent
    @@user_agent
  end

  def self.update_connect_timeout_secs(connect_timeout)
    @@default_env.connect_timeout = connect_timeout
  end

  def self.update_read_timeout_secs(read_timeout)
    @@default_env.read_timeout = read_timeout
  end
end

