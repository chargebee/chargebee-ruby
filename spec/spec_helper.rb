require File.dirname(__FILE__) + '/../lib/chargebee'

require 'rspec'
require 'pp'
require 'mocha'
require 'json'

RSpec.configure do |config|
  config.mock_with :mocha
end

def mock_response(body, code=200)
  body = body.to_json if !(body.kind_of? String)
  m = mock
  m.instance_variable_set('@resp_values', { :body => body, :code => code })
  def m.body; @resp_values[:body]; end
  def m.code; @resp_values[:code]; end
  m
end

ChargeBee.configure(
  :api_key => "dummy_api_key", 
  :site => "dummy_site"
)
