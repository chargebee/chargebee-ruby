Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'
  s.required_ruby_version = '>= 1.9.3'
  s.name              = 'chargebee'
  s.version           = '2.49.0'
  s.date              = '2025-01-16'
  s.summary     = "Ruby client for Chargebee API."
  s.description = "Subscription Billing - Simple. Secure. Affordable. More details at www.chargebee.com."
  s.metadata = {
    "changelog_uri" => "https://github.com/chargebee/chargebee-ruby/blob/master/CHANGELOG.md"
  }

  s.authors = ['Rajaraman S', 'Thiyagarajan T']
  s.email = ['rr@chargebee.com', 'thiyagu@chargebee.com']
  s.homepage = 'https://apidocs.chargebee.com/docs/api?lang=ruby'
  s.license = 'MIT'

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE]

  s.add_dependency('json_pure', '~> 2.1')
  s.add_dependency('cgi', '>=0.1.0', '<1.0.0')
  s.add_development_dependency('rspec', '~> 3.0.0')
  s.add_development_dependency('mocha')

  # = MANIFEST =
  s.files = %w[
    CHANGELOG.md
    Gemfile
    Gemfile.lock
    LICENSE
    README.md
    README.rdoc
    Rakefile
    chargebee.gemspec
    lib/chargebee.rb
    lib/chargebee/environment.rb
    lib/chargebee/errors.rb
    lib/chargebee/list_result.rb
    lib/chargebee/models/addon.rb
    lib/chargebee/models/address.rb
    lib/chargebee/models/advance_invoice_schedule.rb
    lib/chargebee/models/attached_item.rb
    lib/chargebee/models/attribute.rb
    lib/chargebee/models/business_entity.rb
    lib/chargebee/models/business_entity_transfer.rb
    lib/chargebee/models/card.rb
    lib/chargebee/models/comment.rb
    lib/chargebee/models/configuration.rb
    lib/chargebee/models/contact.rb
    lib/chargebee/models/contract_term.rb
    lib/chargebee/models/coupon.rb
    lib/chargebee/models/coupon_code.rb
    lib/chargebee/models/coupon_set.rb
    lib/chargebee/models/credit_note.rb
    lib/chargebee/models/credit_note_estimate.rb
    lib/chargebee/models/csv_tax_rule.rb
    lib/chargebee/models/currency.rb
    lib/chargebee/models/customer.rb
    lib/chargebee/models/customer_entitlement.rb
    lib/chargebee/models/differential_price.rb
    lib/chargebee/models/discount.rb
    lib/chargebee/models/download.rb
    lib/chargebee/models/entitlement.rb
    lib/chargebee/models/entitlement_override.rb
    lib/chargebee/models/estimate.rb
    lib/chargebee/models/event.rb
    lib/chargebee/models/export.rb
    lib/chargebee/models/feature.rb
    lib/chargebee/models/gateway_error_detail.rb
    lib/chargebee/models/gift.rb
    lib/chargebee/models/hierarchy.rb
    lib/chargebee/models/hosted_page.rb
    lib/chargebee/models/impacted_item.rb
    lib/chargebee/models/impacted_item_price.rb
    lib/chargebee/models/impacted_subscription.rb
    lib/chargebee/models/in_app_subscription.rb
    lib/chargebee/models/invoice.rb
    lib/chargebee/models/invoice_estimate.rb
    lib/chargebee/models/item.rb
    lib/chargebee/models/item_entitlement.rb
    lib/chargebee/models/item_family.rb
    lib/chargebee/models/item_price.rb
    lib/chargebee/models/metadata.rb
    lib/chargebee/models/model.rb
    lib/chargebee/models/non_subscription.rb
    lib/chargebee/models/omnichannel_subscription.rb
    lib/chargebee/models/omnichannel_subscription_item.rb
    lib/chargebee/models/omnichannel_transaction.rb
    lib/chargebee/models/order.rb
    lib/chargebee/models/payment_intent.rb
    lib/chargebee/models/payment_reference_number.rb
    lib/chargebee/models/payment_schedule.rb
    lib/chargebee/models/payment_schedule_estimate.rb
    lib/chargebee/models/payment_schedule_scheme.rb
    lib/chargebee/models/payment_source.rb
    lib/chargebee/models/payment_voucher.rb
    lib/chargebee/models/plan.rb
    lib/chargebee/models/portal_session.rb
    lib/chargebee/models/price_variant.rb
    lib/chargebee/models/pricing_page_session.rb
    lib/chargebee/models/promotional_credit.rb
    lib/chargebee/models/purchase.rb
    lib/chargebee/models/quote.rb
    lib/chargebee/models/quote_line_group.rb
    lib/chargebee/models/quoted_charge.rb
    lib/chargebee/models/quoted_subscription.rb
    lib/chargebee/models/ramp.rb
    lib/chargebee/models/recorded_purchase.rb
    lib/chargebee/models/resource_migration.rb
    lib/chargebee/models/site_migration_detail.rb
    lib/chargebee/models/subscription.rb
    lib/chargebee/models/subscription_entitlement.rb
    lib/chargebee/models/subscription_estimate.rb
    lib/chargebee/models/tax_withheld.rb
    lib/chargebee/models/third_party_payment_method.rb
    lib/chargebee/models/time_machine.rb
    lib/chargebee/models/token.rb
    lib/chargebee/models/transaction.rb
    lib/chargebee/models/unbilled_charge.rb
    lib/chargebee/models/usage.rb
    lib/chargebee/models/virtual_bank_account.rb
    lib/chargebee/nativeRequest.rb
    lib/chargebee/request.rb
    lib/chargebee/rest.rb
    lib/chargebee/result.rb
    lib/chargebee/util.rb
    lib/ssl/ca-certs.crt
    spec/chargebee/list_result_spec.rb
    spec/chargebee_spec.rb
    spec/errors_spec.rb
    spec/sample_response.rb
    spec/spec_helper.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^spec\/.*\.rb/ }
end
