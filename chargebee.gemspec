Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.name              = 'chargebee'
  s.version           = '1.4.6'
  s.date              = '2014-09-16'

  s.summary     = "Ruby client for Chargebee API."
  s.description = "Subscription Billing - Simple. Secure. Affordable. More details at www.chargebee.com."

  s.authors = ['Rajaraman S', 'Thiyagarajan T']
  s.email = ['rr@chargebee.com', 'thiyagu@chargebee.com']
  s.homepage = 'https://apidocs.chargebee.com/api/docs?lang=ruby'
  

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.rdoc LICENSE]

  s.add_dependency('json_pure', '~> 1.5')
  s.add_dependency('rest-client', '~> 1.4')

  s.add_development_dependency('rpsec', '~> 2.9.0')
  s.add_development_dependency('mocha')

  # = MANIFEST =
  s.files = %w[
    CHANGELOG.md
    LICENSE
    README.rdoc
    Rakefile
    chargebee.gemspec
    lib/chargebee.rb
    lib/chargebee/environment.rb
    lib/chargebee/errors.rb
    lib/chargebee/list_result.rb
    lib/chargebee/models/addon.rb
    lib/chargebee/models/address.rb
    lib/chargebee/models/card.rb
    lib/chargebee/models/comment.rb
    lib/chargebee/models/coupon.rb
    lib/chargebee/models/coupon_code.rb
    lib/chargebee/models/customer.rb
    lib/chargebee/models/download.rb
    lib/chargebee/models/estimate.rb
    lib/chargebee/models/event.rb
    lib/chargebee/models/hosted_page.rb
    lib/chargebee/models/invoice.rb
    lib/chargebee/models/model.rb
    lib/chargebee/models/plan.rb
    lib/chargebee/models/portal_session.rb
    lib/chargebee/models/subscription.rb
    lib/chargebee/models/transaction.rb
    lib/chargebee/request.rb
    lib/chargebee/rest.rb
    lib/chargebee/result.rb
    lib/chargebee/util.rb
    lib/ssl/ca-certs.crt
    spec/chargebee/list_result_spec.rb
    spec/chargebee_spec.rb
    spec/sample_response.rb
    spec/spec_helper.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^spec\/.*\.rb/ }
end
