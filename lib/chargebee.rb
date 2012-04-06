require File.dirname(__FILE__) + '/chargebee/environment'
require File.dirname(__FILE__) + '/chargebee/rest'
require File.dirname(__FILE__) + '/chargebee/util'
require File.dirname(__FILE__) + '/chargebee/request'
require File.dirname(__FILE__) + '/chargebee/result'
require File.dirname(__FILE__) + '/chargebee/list_result'

require File.dirname(__FILE__) + '/chargebee/api_error'

require File.dirname(__FILE__) + '/chargebee/models/model'
require File.dirname(__FILE__) + '/chargebee/models/subscription'
require File.dirname(__FILE__) + '/chargebee/models/customer'
require File.dirname(__FILE__) + '/chargebee/models/card'
require File.dirname(__FILE__) + '/chargebee/models/transaction'
require File.dirname(__FILE__) + '/chargebee/models/invoice'
require File.dirname(__FILE__) + '/chargebee/models/hosted_page'
require File.dirname(__FILE__) + '/chargebee/models/event'


module ChargeBee

  @@default_env = nil
  
  def self.configure(options)
    @@default_env = Environment.new(options)
  end
  
  def self.default_env
    @@default_env
  end
  
end

