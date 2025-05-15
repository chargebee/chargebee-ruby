module ChargeBee
  class Result

    IDEMPOTENCY_REPLAYED_HEADER = :chargebee_idempotency_replayed

    def initialize(response, rheaders = nil, http_status_code=nil)
      @response = response
        @rheaders = rheaders
        @http_status_code = http_status_code
    end

    def get_response_headers()
        @rheaders
    end

    def get_raw_response()
        @response
    end

    def get_http_status_code()
        @http_status_code
    end

    def is_idempotency_replayed()
        replayed_header = get_response_headers[IDEMPOTENCY_REPLAYED_HEADER]
        if replayed_header != nil
           return !!replayed_header
        else
           return false
        end
    end

    def subscription() 
        subscription = get(:subscription, Subscription,
        {:subscription_items => Subscription::SubscriptionItem, :item_tiers => Subscription::ItemTier, :charged_items => Subscription::ChargedItem, :addons => Subscription::Addon, :event_based_addons => Subscription::EventBasedAddon, :charged_event_based_addons => Subscription::ChargedEventBasedAddon, :coupons => Subscription::Coupon, :shipping_address => Subscription::ShippingAddress, :referral_info => Subscription::ReferralInfo, :billing_override => Subscription::BillingOverride, :contract_term => Subscription::ContractTerm, :discounts => Subscription::Discount});
        return subscription;
    end

    def contract_term() 
        contract_term = get(:contract_term, ContractTerm);
        return contract_term;
    end

    def discount() 
        discount = get(:discount, Discount);
        return discount;
    end

    def advance_invoice_schedule() 
        advance_invoice_schedule = get(:advance_invoice_schedule, AdvanceInvoiceSchedule,
        {:fixed_interval_schedule => AdvanceInvoiceSchedule::FixedIntervalSchedule, :specific_dates_schedule => AdvanceInvoiceSchedule::SpecificDatesSchedule});
        return advance_invoice_schedule;
    end

    def customer() 
        customer = get(:customer, Customer,
        {:billing_address => Customer::BillingAddress, :referral_urls => Customer::ReferralUrl, :contacts => Customer::Contact, :payment_method => Customer::PaymentMethod, :balances => Customer::Balance, :entity_identifiers => Customer::EntityIdentifier, :tax_providers_fields => Customer::TaxProvidersField, :relationship => Customer::Relationship, :parent_account_access => Customer::ParentAccountAccess, :child_account_access => Customer::ChildAccountAccess});
        return customer;
    end

    def hierarchy() 
        hierarchy = get(:hierarchy, Hierarchy);
        return hierarchy;
    end

    def contact() 
        contact = get(:contact, Contact);
        return contact;
    end

    def business_entity_transfer() 
        business_entity_transfer = get(:business_entity_transfer, BusinessEntityTransfer);
        return business_entity_transfer;
    end

    def token() 
        token = get(:token, Token);
        return token;
    end

    def payment_source() 
        payment_source = get(:payment_source, PaymentSource,
        {:card => PaymentSource::Card, :bank_account => PaymentSource::BankAccount, :cust_voucher_source => PaymentSource::CustVoucherSource, :billing_address => PaymentSource::BillingAddress, :amazon_payment => PaymentSource::AmazonPayment, :upi => PaymentSource::Upi, :paypal => PaymentSource::Paypal, :venmo => PaymentSource::Venmo, :klarna_pay_now => PaymentSource::KlarnaPayNow, :mandates => PaymentSource::Mandate});
        return payment_source;
    end

    def third_party_payment_method() 
        third_party_payment_method = get(:third_party_payment_method, ThirdPartyPaymentMethod);
        return third_party_payment_method;
    end

    def virtual_bank_account() 
        virtual_bank_account = get(:virtual_bank_account, VirtualBankAccount);
        return virtual_bank_account;
    end

    def card() 
        card = get(:card, Card);
        return card;
    end

    def promotional_credit() 
        promotional_credit = get(:promotional_credit, PromotionalCredit);
        return promotional_credit;
    end

    def invoice() 
        invoice = get(:invoice, Invoice,
        {:line_items => Invoice::LineItem, :discounts => Invoice::Discount, :line_item_discounts => Invoice::LineItemDiscount, :taxes => Invoice::Tax, :line_item_taxes => Invoice::LineItemTax, :line_item_credits => Invoice::LineItemCredit, :line_item_tiers => Invoice::LineItemTier, :linked_payments => Invoice::LinkedPayment, :dunning_attempts => Invoice::DunningAttempt, :applied_credits => Invoice::AppliedCredit, :adjustment_credit_notes => Invoice::AdjustmentCreditNote, :issued_credit_notes => Invoice::IssuedCreditNote, :linked_orders => Invoice::LinkedOrder, :notes => Invoice::Note, :shipping_address => Invoice::ShippingAddress, :statement_descriptor => Invoice::StatementDescriptor, :billing_address => Invoice::BillingAddress, :einvoice => Invoice::Einvoice, :site_details_at_creation => Invoice::SiteDetailsAtCreation, :tax_origin => Invoice::TaxOrigin, :line_item_addresses => Invoice::LineItemAddress});
        return invoice;
    end

    def payment_reference_number() 
        payment_reference_number = get(:payment_reference_number, PaymentReferenceNumber);
        return payment_reference_number;
    end

    def payment_schedule() 
        payment_schedule = get(:payment_schedule, PaymentSchedule,
        {:schedule_entries => PaymentSchedule::ScheduleEntry});
        return payment_schedule;
    end

    def tax_withheld() 
        tax_withheld = get(:tax_withheld, TaxWithheld);
        return tax_withheld;
    end

    def credit_note() 
        credit_note = get(:credit_note, CreditNote,
        {:einvoice => CreditNote::Einvoice, :line_items => CreditNote::LineItem, :discounts => CreditNote::Discount, :line_item_discounts => CreditNote::LineItemDiscount, :line_item_tiers => CreditNote::LineItemTier, :taxes => CreditNote::Tax, :line_item_taxes => CreditNote::LineItemTax, :linked_refunds => CreditNote::LinkedRefund, :allocations => CreditNote::Allocation, :shipping_address => CreditNote::ShippingAddress, :billing_address => CreditNote::BillingAddress, :site_details_at_creation => CreditNote::SiteDetailsAtCreation, :tax_origin => CreditNote::TaxOrigin, :line_item_addresses => CreditNote::LineItemAddress});
        return credit_note;
    end

    def unbilled_charge() 
        unbilled_charge = get(:unbilled_charge, UnbilledCharge,
        {:tiers => UnbilledCharge::Tier});
        return unbilled_charge;
    end

    def order() 
        order = get(:order, Order,
        {:order_line_items => Order::OrderLineItem, :shipping_address => Order::ShippingAddress, :billing_address => Order::BillingAddress, :line_item_taxes => Order::LineItemTax, :line_item_discounts => Order::LineItemDiscount, :linked_credit_notes => Order::LinkedCreditNote, :resent_orders => Order::ResentOrder});
        return order;
    end

    def gift() 
        gift = get(:gift, Gift,
        {:gifter => Gift::Gifter, :gift_receiver => Gift::GiftReceiver, :gift_timelines => Gift::GiftTimeline});
        return gift;
    end

    def transaction() 
        transaction = get(:transaction, Transaction,
        {:linked_invoices => Transaction::LinkedInvoice, :linked_credit_notes => Transaction::LinkedCreditNote, :linked_refunds => Transaction::LinkedRefund, :linked_payments => Transaction::LinkedPayment, :gateway_error_detail => Transaction::GatewayErrorDetail});
        return transaction;
    end

    def hosted_page() 
        hosted_page = get(:hosted_page, HostedPage);
        return hosted_page;
    end

    def estimate() 
        estimate = get(:estimate, Estimate, {},
        {:subscription_estimate => SubscriptionEstimate, :subscription_estimates => SubscriptionEstimate, :invoice_estimate => InvoiceEstimate, :invoice_estimates => InvoiceEstimate, :payment_schedule_estimates => PaymentScheduleEstimate, :next_invoice_estimate => InvoiceEstimate, :credit_note_estimates => CreditNoteEstimate, :unbilled_charge_estimates => UnbilledCharge});
        estimate.init_dependant(@response[:estimate], :subscription_estimate,
        {:shipping_address => SubscriptionEstimate::ShippingAddress, :contract_term => SubscriptionEstimate::ContractTerm});
        estimate.init_dependant(@response[:estimate], :invoice_estimate,
        {:line_items => InvoiceEstimate::LineItem, :discounts => InvoiceEstimate::Discount, :taxes => InvoiceEstimate::Tax, :line_item_taxes => InvoiceEstimate::LineItemTax, :line_item_tiers => InvoiceEstimate::LineItemTier, :line_item_credits => InvoiceEstimate::LineItemCredit, :line_item_discounts => InvoiceEstimate::LineItemDiscount, :line_item_addresses => InvoiceEstimate::LineItemAddress});
        estimate.init_dependant(@response[:estimate], :next_invoice_estimate,
        {:line_items => InvoiceEstimate::LineItem, :discounts => InvoiceEstimate::Discount, :taxes => InvoiceEstimate::Tax, :line_item_taxes => InvoiceEstimate::LineItemTax, :line_item_tiers => InvoiceEstimate::LineItemTier, :line_item_credits => InvoiceEstimate::LineItemCredit, :line_item_discounts => InvoiceEstimate::LineItemDiscount, :line_item_addresses => InvoiceEstimate::LineItemAddress});
        estimate.init_dependant_list(@response[:estimate], :subscription_estimates,
        {:shipping_address => SubscriptionEstimate::ShippingAddress, :contract_term => SubscriptionEstimate::ContractTerm});
        estimate.init_dependant_list(@response[:estimate], :invoice_estimates,
        {:line_items => InvoiceEstimate::LineItem, :discounts => InvoiceEstimate::Discount, :taxes => InvoiceEstimate::Tax, :line_item_taxes => InvoiceEstimate::LineItemTax, :line_item_tiers => InvoiceEstimate::LineItemTier, :line_item_credits => InvoiceEstimate::LineItemCredit, :line_item_discounts => InvoiceEstimate::LineItemDiscount, :line_item_addresses => InvoiceEstimate::LineItemAddress});
        estimate.init_dependant_list(@response[:estimate], :payment_schedule_estimates,
        {:schedule_entries => PaymentScheduleEstimate::ScheduleEntry});
        estimate.init_dependant_list(@response[:estimate], :credit_note_estimates,
        {:line_items => CreditNoteEstimate::LineItem, :discounts => CreditNoteEstimate::Discount, :taxes => CreditNoteEstimate::Tax, :line_item_taxes => CreditNoteEstimate::LineItemTax, :line_item_discounts => CreditNoteEstimate::LineItemDiscount, :line_item_tiers => CreditNoteEstimate::LineItemTier});
        estimate.init_dependant_list(@response[:estimate], :unbilled_charge_estimates,
        {:tiers => UnbilledCharge::Tier});
        return estimate;
    end

    def quote() 
        quote = get(:quote, Quote,
        {:line_items => Quote::LineItem, :discounts => Quote::Discount, :line_item_discounts => Quote::LineItemDiscount, :taxes => Quote::Tax, :line_item_taxes => Quote::LineItemTax, :line_item_tiers => Quote::LineItemTier, :shipping_address => Quote::ShippingAddress, :billing_address => Quote::BillingAddress});
        return quote;
    end

    def quoted_subscription() 
        quoted_subscription = get(:quoted_subscription, QuotedSubscription,
        {:addons => QuotedSubscription::Addon, :event_based_addons => QuotedSubscription::EventBasedAddon, :coupons => QuotedSubscription::Coupon, :subscription_items => QuotedSubscription::SubscriptionItem, :item_tiers => QuotedSubscription::ItemTier, :quoted_contract_term => QuotedSubscription::QuotedContractTerm});
        return quoted_subscription;
    end

    def quoted_charge() 
        quoted_charge = get(:quoted_charge, QuotedCharge,
        {:charges => QuotedCharge::Charge, :addons => QuotedCharge::Addon, :invoice_items => QuotedCharge::InvoiceItem, :item_tiers => QuotedCharge::ItemTier, :coupons => QuotedCharge::Coupon});
        return quoted_charge;
    end

    def quote_line_group() 
        quote_line_group = get(:quote_line_group, QuoteLineGroup,
        {:line_items => QuoteLineGroup::LineItem, :discounts => QuoteLineGroup::Discount, :line_item_discounts => QuoteLineGroup::LineItemDiscount, :taxes => QuoteLineGroup::Tax, :line_item_taxes => QuoteLineGroup::LineItemTax});
        return quote_line_group;
    end

    def plan() 
        plan = get(:plan, Plan,
        {:tiers => Plan::Tier, :tax_providers_fields => Plan::TaxProvidersField, :applicable_addons => Plan::ApplicableAddon, :attached_addons => Plan::AttachedAddon, :event_based_addons => Plan::EventBasedAddon});
        return plan;
    end

    def addon() 
        addon = get(:addon, Addon,
        {:tiers => Addon::Tier, :tax_providers_fields => Addon::TaxProvidersField});
        return addon;
    end

    def coupon() 
        coupon = get(:coupon, Coupon,
        {:item_constraints => Coupon::ItemConstraint, :item_constraint_criteria => Coupon::ItemConstraintCriteria, :coupon_constraints => Coupon::CouponConstraint});
        return coupon;
    end

    def coupon_set() 
        coupon_set = get(:coupon_set, CouponSet);
        return coupon_set;
    end

    def coupon_code() 
        coupon_code = get(:coupon_code, CouponCode);
        return coupon_code;
    end

    def address() 
        address = get(:address, Address);
        return address;
    end

    def usage() 
        usage = get(:usage, Usage);
        return usage;
    end

    def event() 
        event = get(:event, Event,
        {:webhooks => Event::Webhook});
        return event;
    end

    def comment() 
        comment = get(:comment, Comment);
        return comment;
    end

    def download() 
        download = get(:download, Download);
        return download;
    end

    def portal_session() 
        portal_session = get(:portal_session, PortalSession,
        {:linked_customers => PortalSession::LinkedCustomer});
        return portal_session;
    end

    def site_migration_detail() 
        site_migration_detail = get(:site_migration_detail, SiteMigrationDetail);
        return site_migration_detail;
    end

    def resource_migration() 
        resource_migration = get(:resource_migration, ResourceMigration);
        return resource_migration;
    end

    def time_machine() 
        time_machine = get(:time_machine, TimeMachine);
        return time_machine;
    end

    def export() 
        export = get(:export, Export,
        {:download => Export::Download});
        return export;
    end

    def payment_intent() 
        payment_intent = get(:payment_intent, PaymentIntent,
        {:payment_attempt => PaymentIntent::PaymentAttempt});
        return payment_intent;
    end

    def gateway_error_detail() 
        gateway_error_detail = get(:gateway_error_detail, GatewayErrorDetail);
        return gateway_error_detail;
    end

    def item_family() 
        item_family = get(:item_family, ItemFamily);
        return item_family;
    end

    def item() 
        item = get(:item, Item,
        {:applicable_items => Item::ApplicableItem, :bundle_items => Item::BundleItem, :bundle_configuration => Item::BundleConfiguration});
        return item;
    end

    def price_variant() 
        price_variant = get(:price_variant, PriceVariant,
        {:attributes => PriceVariant::Attribute});
        return price_variant;
    end

    def attribute() 
        attribute = get(:attribute, Attribute);
        return attribute;
    end

    def item_price() 
        item_price = get(:item_price, ItemPrice,
        {:tiers => ItemPrice::Tier, :tax_detail => ItemPrice::TaxDetail, :tax_providers_fields => ItemPrice::TaxProvidersField, :accounting_detail => ItemPrice::AccountingDetail});
        return item_price;
    end

    def attached_item() 
        attached_item = get(:attached_item, AttachedItem);
        return attached_item;
    end

    def differential_price() 
        differential_price = get(:differential_price, DifferentialPrice,
        {:tiers => DifferentialPrice::Tier, :parent_periods => DifferentialPrice::ParentPeriod});
        return differential_price;
    end

    def configuration() 
        configuration = get(:configuration, Configuration);
        return configuration;
    end

    def feature() 
        feature = get(:feature, Feature,
        {:levels => Feature::Level});
        return feature;
    end

    def impacted_subscription() 
        impacted_subscription = get(:impacted_subscription, ImpactedSubscription,
        {:download => ImpactedSubscription::Download});
        return impacted_subscription;
    end

    def impacted_item() 
        impacted_item = get(:impacted_item, ImpactedItem,
        {:download => ImpactedItem::Download});
        return impacted_item;
    end

    def impacted_item_price() 
        impacted_item_price = get(:impacted_item_price, ImpactedItemPrice,
        {:download => ImpactedItemPrice::Download});
        return impacted_item_price;
    end

    def metadata() 
        metadata = get(:metadata, Metadata);
        return metadata;
    end

    def subscription_entitlement() 
        subscription_entitlement = get(:subscription_entitlement, SubscriptionEntitlement,
        {:component => SubscriptionEntitlement::Component});
        return subscription_entitlement;
    end

    def customer_entitlement() 
        customer_entitlement = get(:customer_entitlement, CustomerEntitlement);
        return customer_entitlement;
    end

    def item_entitlement() 
        item_entitlement = get(:item_entitlement, ItemEntitlement);
        return item_entitlement;
    end

    def entitlement() 
        entitlement = get(:entitlement, Entitlement);
        return entitlement;
    end

    def in_app_subscription() 
        in_app_subscription = get(:in_app_subscription, InAppSubscription);
        return in_app_subscription;
    end

    def non_subscription() 
        non_subscription = get(:non_subscription, NonSubscription);
        return non_subscription;
    end

    def entitlement_override() 
        entitlement_override = get(:entitlement_override, EntitlementOverride);
        return entitlement_override;
    end

    def business_entity() 
        business_entity = get(:business_entity, BusinessEntity);
        return business_entity;
    end

    def purchase() 
        purchase = get(:purchase, Purchase);
        return purchase;
    end

    def payment_voucher() 
        payment_voucher = get(:payment_voucher, PaymentVoucher,
        {:linked_invoices => PaymentVoucher::LinkedInvoice});
        return payment_voucher;
    end

    def currency() 
        currency = get(:currency, Currency);
        return currency;
    end

    def ramp() 
        ramp = get(:ramp, Ramp,
        {:items_to_add => Ramp::ItemsToAdd, :items_to_update => Ramp::ItemsToUpdate, :coupons_to_add => Ramp::CouponsToAdd, :discounts_to_add => Ramp::DiscountsToAdd, :item_tiers => Ramp::ItemTier, :status_transition_reason => Ramp::StatusTransitionReason});
        return ramp;
    end

    def payment_schedule_scheme() 
        payment_schedule_scheme = get(:payment_schedule_scheme, PaymentScheduleScheme,
        {:preferred_schedules => PaymentScheduleScheme::PreferredSchedule});
        return payment_schedule_scheme;
    end

    def pricing_page_session() 
        pricing_page_session = get(:pricing_page_session, PricingPageSession);
        return pricing_page_session;
    end

    def omnichannel_subscription() 
        omnichannel_subscription = get(:omnichannel_subscription, OmnichannelSubscription, {},
        {:omnichannel_subscription_items => OmnichannelSubscriptionItem});
        omnichannel_subscription.init_dependant_list(@response[:omnichannel_subscription], :omnichannel_subscription_items,
        {:upcoming_renewal => OmnichannelSubscriptionItem::UpcomingRenewal});
        return omnichannel_subscription;
    end

    def omnichannel_transaction() 
        omnichannel_transaction = get(:omnichannel_transaction, OmnichannelTransaction);
        return omnichannel_transaction;
    end

    def omnichannel_subscription_item() 
        omnichannel_subscription_item = get(:omnichannel_subscription_item, OmnichannelSubscriptionItem,
        {:upcoming_renewal => OmnichannelSubscriptionItem::UpcomingRenewal});
        return omnichannel_subscription_item;
    end

    def recorded_purchase() 
        recorded_purchase = get(:recorded_purchase, RecordedPurchase,
        {:linked_omnichannel_subscriptions => RecordedPurchase::LinkedOmnichannelSubscription, :error_detail => RecordedPurchase::ErrorDetail});
        return recorded_purchase;
    end

    def rule() 
        rule = get(:rule, Rule);
        return rule;
    end

    def usage_event() 
        usage_event = get(:usage_event, UsageEvent);
        return usage_event;
    end

    def omnichannel_subscription_item_scheduled_change() 
        omnichannel_subscription_item_scheduled_change = get(:omnichannel_subscription_item_scheduled_change, OmnichannelSubscriptionItemScheduledChange,
        {:current_state => OmnichannelSubscriptionItemScheduledChange::CurrentState, :scheduled_state => OmnichannelSubscriptionItemScheduledChange::ScheduledState});
        return omnichannel_subscription_item_scheduled_change;
    end

    def usage_file() 
        usage_file = get(:usage_file, UsageFile,
        {:upload_detail => UsageFile::UploadDetail});
        return usage_file;
    end

    def advance_invoice_schedules() 
        advance_invoice_schedules = get_list(:advance_invoice_schedules, AdvanceInvoiceSchedule,
        {:fixed_interval_schedule => AdvanceInvoiceSchedule::FixedIntervalSchedule, :specific_dates_schedule => AdvanceInvoiceSchedule::SpecificDatesSchedule});
        return advance_invoice_schedules;
    end

    def hierarchies() 
        hierarchies = get_list(:hierarchies, Hierarchy,
        {});
        return hierarchies;
    end

    def invoices() 
        invoices = get_list(:invoices, Invoice,
        {:line_items => Invoice::LineItem, :discounts => Invoice::Discount, :line_item_discounts => Invoice::LineItemDiscount, :taxes => Invoice::Tax, :line_item_taxes => Invoice::LineItemTax, :line_item_credits => Invoice::LineItemCredit, :line_item_tiers => Invoice::LineItemTier, :linked_payments => Invoice::LinkedPayment, :dunning_attempts => Invoice::DunningAttempt, :applied_credits => Invoice::AppliedCredit, :adjustment_credit_notes => Invoice::AdjustmentCreditNote, :issued_credit_notes => Invoice::IssuedCreditNote, :linked_orders => Invoice::LinkedOrder, :notes => Invoice::Note, :shipping_address => Invoice::ShippingAddress, :statement_descriptor => Invoice::StatementDescriptor, :billing_address => Invoice::BillingAddress, :einvoice => Invoice::Einvoice, :site_details_at_creation => Invoice::SiteDetailsAtCreation, :tax_origin => Invoice::TaxOrigin, :line_item_addresses => Invoice::LineItemAddress});
        return invoices;
    end

    def payment_schedules() 
        payment_schedules = get_list(:payment_schedules, PaymentSchedule,
        {:schedule_entries => PaymentSchedule::ScheduleEntry});
        return payment_schedules;
    end

    def credit_notes() 
        credit_notes = get_list(:credit_notes, CreditNote,
        {:einvoice => CreditNote::Einvoice, :line_items => CreditNote::LineItem, :discounts => CreditNote::Discount, :line_item_discounts => CreditNote::LineItemDiscount, :line_item_tiers => CreditNote::LineItemTier, :taxes => CreditNote::Tax, :line_item_taxes => CreditNote::LineItemTax, :linked_refunds => CreditNote::LinkedRefund, :allocations => CreditNote::Allocation, :shipping_address => CreditNote::ShippingAddress, :billing_address => CreditNote::BillingAddress, :site_details_at_creation => CreditNote::SiteDetailsAtCreation, :tax_origin => CreditNote::TaxOrigin, :line_item_addresses => CreditNote::LineItemAddress});
        return credit_notes;
    end

    def unbilled_charges() 
        unbilled_charges = get_list(:unbilled_charges, UnbilledCharge,
        {:tiers => UnbilledCharge::Tier});
        return unbilled_charges;
    end

    def downloads() 
        downloads = get_list(:downloads, Download,
        {});
        return downloads;
    end

    def configurations() 
        configurations = get_list(:configurations, Configuration,
        {});
        return configurations;
    end

    def in_app_subscriptions() 
        in_app_subscriptions = get_list(:in_app_subscriptions, InAppSubscription,
        {});
        return in_app_subscriptions;
    end


    def to_s(*args)
        JSON.pretty_generate(@response)
    end

    private
    def get_list(type, klass, sub_types = {}, dependant_types = {}, dependant_sub_types = {})
      if(@response[type] == nil)
        return nil
      end
      set_val = Array.new
      @response[type].each do |obj|
        case obj
        when Hash
          model = klass.construct(obj, sub_types, dependant_types)
          dependant_sub_types.each do |k,v|
                model.init_dependant(obj, k, v);
          end
          set_val.push(model)
        end
      end
      return instance_variable_set("@#{type}", set_val)
    end

    private
    def get(type, klass, sub_types = {}, dependant_types = {})
      return klass.construct(@response[type], sub_types, dependant_types)
    end

  end
end
