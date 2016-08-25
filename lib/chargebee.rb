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
require File.dirname(__FILE__) + '/chargebee/models/comment'
require File.dirname(__FILE__) + '/chargebee/models/portal_session'
require File.dirname(__FILE__) + '/chargebee/models/download'

module ChargeBee

  VERSION = '2.1.2'

  @@default_env = nil
  @@verify_ca_certs = true
  @@ca_cert_path = File.join(File.dirname(__FILE__), '/ssl/ca-certs.crt')

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

end

