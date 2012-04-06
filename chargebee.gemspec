$:.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'chargebee/version'

spec = Gem::Specification.new do |s|
  s.name = 'chargebee'
  s.version = ChargeBee::Version.to_s
  s.summary = 'Ruby client for Chargebee API'
  s.description = 'Subscription Billing - Simple. Secure. Affordable. More details at www.chargebee.com'
  
  s.files =  Dir['./lib/**/*']
    
  s.authors = ['Rajaraman S', 'Thiyagarajan T']
  s.email = ['rr@chargebee.com', 'thiyagu@chargebee.com']
  s.homepage = 'https://apidocs.chargebee.com/api/docs'
  
  s.homepage = 'http://github.com/chargebee/chargebee-ruby'

  s.add_dependency('json_pure', '~> 1.5')
  s.add_dependency('rest-client', '~> 1.4')
end
