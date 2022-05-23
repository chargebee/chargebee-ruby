module ChargeBee
  class Result

    def initialize(response)
      @response = response
    end
    
    def subscription() 
        subscription = get(:subscription, Subscription,
        {:subscription_items => Subscription::SubscriptionItem, :item_tiers => Subscription::ItemTier, :charged_items => Subscription::ChargedItem, :addons => Subscription::Addon, :event_based_addons => Subscription::EventBasedAddon, :charged_event_based_addons => Subscription::ChargedEventBasedAddon, :coupons => Subscription::Coupon, :shipping_address => Subscription::ShippingAddress, :referral_info => Subscription::ReferralInfo, :contract_term => Subscription::ContractTerm});
        return subscription;
    end

    def contract_term() 
        contract_term = get(:contract_term, ContractTerm);
        return contract_term;
    end

    def advance_invoice_schedule() 
        advance_invoice_schedule = get(:advance_invoice_schedule, AdvanceInvoiceSchedule,
        {:fixed_interval_schedule => AdvanceInvoiceSchedule::FixedIntervalSchedule, :specific_dates_schedule => AdvanceInvoiceSchedule::SpecificDatesSchedule});
        return advance_invoice_schedule;
    end

    def customer() 
        customer = get(:customer, Customer,
        {:billing_address => Customer::BillingAddress, :referral_urls => Customer::ReferralUrl, :contacts => Customer::Contact, :payment_method => Customer::PaymentMethod, :balances => Customer::Balance, :entity_identifiers => Customer::EntityIdentifier, :relationship => Customer::Relationship, :parent_account_access => Customer::ParentAccountAccess, :child_account_access => Customer::ChildAccountAccess});
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

    def token() 
        token = get(:token, Token);
        return token;
    end

    def payment_source() 
        payment_source = get(:payment_source, PaymentSource,
        {:card => PaymentSource::Card, :bank_account => PaymentSource::BankAccount, :amazon_payment => PaymentSource::AmazonPayment, :upi => PaymentSource::Upi, :paypal => PaymentSource::Paypal, :mandates => PaymentSource::Mandate});
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
        {:line_items => Invoice::LineItem, :discounts => Invoice::Discount, :line_item_discounts => Invoice::LineItemDiscount, :taxes => Invoice::Tax, :line_item_taxes => Invoice::LineItemTax, :line_item_tiers => Invoice::LineItemTier, :linked_payments => Invoice::LinkedPayment, :dunning_attempts => Invoice::DunningAttempt, :applied_credits => Invoice::AppliedCredit, :adjustment_credit_notes => Invoice::AdjustmentCreditNote, :issued_credit_notes => Invoice::IssuedCreditNote, :linked_orders => Invoice::LinkedOrder, :notes => Invoice::Note, :shipping_address => Invoice::ShippingAddress, :billing_address => Invoice::BillingAddress, :einvoice => Invoice::Einvoice});
        return invoice;
    end

    def tax_withheld() 
        tax_withheld = get(:tax_withheld, TaxWithheld);
        return tax_withheld;
    end

    def credit_note() 
        credit_note = get(:credit_note, CreditNote,
        {:einvoice => CreditNote::Einvoice, :line_items => CreditNote::LineItem, :discounts => CreditNote::Discount, :line_item_discounts => CreditNote::LineItemDiscount, :line_item_tiers => CreditNote::LineItemTier, :taxes => CreditNote::Tax, :line_item_taxes => CreditNote::LineItemTax, :linked_refunds => CreditNote::LinkedRefund, :allocations => CreditNote::Allocation});
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
        {:linked_invoices => Transaction::LinkedInvoice, :linked_credit_notes => Transaction::LinkedCreditNote, :linked_refunds => Transaction::LinkedRefund, :linked_payments => Transaction::LinkedPayment});
        return transaction;
    end

    def hosted_page() 
        hosted_page = get(:hosted_page, HostedPage);
        return hosted_page;
    end

    def estimate() 
        estimate = get(:estimate, Estimate, {},
        {:subscription_estimate => SubscriptionEstimate, :invoice_estimate => InvoiceEstimate, :invoice_estimates => InvoiceEstimate, :next_invoice_estimate => InvoiceEstimate, :credit_note_estimates => CreditNoteEstimate, :unbilled_charge_estimates => UnbilledCharge});
        estimate.init_dependant(@response[:estimate], :subscription_estimate,
        {:shipping_address => SubscriptionEstimate::ShippingAddress, :contract_term => SubscriptionEstimate::ContractTerm});
        estimate.init_dependant(@response[:estimate], :invoice_estimate,
        {:line_items => InvoiceEstimate::LineItem, :discounts => InvoiceEstimate::Discount, :taxes => InvoiceEstimate::Tax, :line_item_taxes => InvoiceEstimate::LineItemTax, :line_item_tiers => InvoiceEstimate::LineItemTier, :line_item_discounts => InvoiceEstimate::LineItemDiscount});
        estimate.init_dependant(@response[:estimate], :next_invoice_estimate,
        {:line_items => InvoiceEstimate::LineItem, :discounts => InvoiceEstimate::Discount, :taxes => InvoiceEstimate::Tax, :line_item_taxes => InvoiceEstimate::LineItemTax, :line_item_tiers => InvoiceEstimate::LineItemTier, :line_item_discounts => InvoiceEstimate::LineItemDiscount});
        estimate.init_dependant_list(@response[:estimate], :invoice_estimates,
        {:line_items => InvoiceEstimate::LineItem, :discounts => InvoiceEstimate::Discount, :taxes => InvoiceEstimate::Tax, :line_item_taxes => InvoiceEstimate::LineItemTax, :line_item_tiers => InvoiceEstimate::LineItemTier, :line_item_discounts => InvoiceEstimate::LineItemDiscount});
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
        {:tiers => Plan::Tier, :applicable_addons => Plan::ApplicableAddon, :attached_addons => Plan::AttachedAddon, :event_based_addons => Plan::EventBasedAddon});
        return plan;
    end

    def addon() 
        addon = get(:addon, Addon,
        {:tiers => Addon::Tier});
        return addon;
    end

    def coupon() 
        coupon = get(:coupon, Coupon,
        {:item_constraints => Coupon::ItemConstraint, :item_constraint_criteria => Coupon::ItemConstraintCriteria});
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

    def item_family() 
        item_family = get(:item_family, ItemFamily);
        return item_family;
    end

    def item() 
        item = get(:item, Item,
        {:applicable_items => Item::ApplicableItem});
        return item;
    end

    def item_price() 
        item_price = get(:item_price, ItemPrice,
        {:tiers => ItemPrice::Tier, :tax_detail => ItemPrice::TaxDetail, :accounting_detail => ItemPrice::AccountingDetail});
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

    def feature() 
        feature = get(:feature, Feature,
        {:levels => Feature::Level});
        return feature;
    end

    def subscription_entitlement() 
        subscription_entitlement = get(:subscription_entitlement, SubscriptionEntitlement,
        {:component => SubscriptionEntitlement::Component, :embedded_resource => SubscriptionEntitlement::EmbeddedResource});
        return subscription_entitlement;
    end

    def item_entitlement() 
        item_entitlement = get(:item_entitlement, ItemEntitlement,
        {:embedded_resource => ItemEntitlement::EmbeddedResource});
        return item_entitlement;
    end

    def entitlement_override() 
        entitlement_override = get(:entitlement_override, EntitlementOverride,
        {:embedded_resource => EntitlementOverride::EmbeddedResource});
        return entitlement_override;
    end


    def unbilled_charges()
        unbilled_charges = get_list(:unbilled_charges, UnbilledCharge,
        {:tiers => UnbilledCharge::Tier});
        return unbilled_charges;
    end
    
    def credit_notes()
        credit_notes = get_list(:credit_notes, CreditNote,
        {:einvoice => CreditNote::Einvoice, :line_items => CreditNote::LineItem, :discounts => CreditNote::Discount, :line_item_discounts => CreditNote::LineItemDiscount, :line_item_tiers => CreditNote::LineItemTier, :taxes => CreditNote::Tax, :line_item_taxes => CreditNote::LineItemTax, :linked_refunds => CreditNote::LinkedRefund, :allocations => CreditNote::Allocation});
        return credit_notes;
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
    
    def downloads()
        downloads = get_list(:downloads, Download,
        {});
        return downloads;
    end
    
    def invoices()
        invoices = get_list(:invoices, Invoice,
        {:line_items => Invoice::LineItem, :discounts => Invoice::Discount, :line_item_discounts => Invoice::LineItemDiscount, :taxes => Invoice::Tax, :line_item_taxes => Invoice::LineItemTax, :line_item_tiers => Invoice::LineItemTier, :linked_payments => Invoice::LinkedPayment, :dunning_attempts => Invoice::DunningAttempt, :applied_credits => Invoice::AppliedCredit, :adjustment_credit_notes => Invoice::AdjustmentCreditNote, :issued_credit_notes => Invoice::IssuedCreditNote, :linked_orders => Invoice::LinkedOrder, :notes => Invoice::Note, :shipping_address => Invoice::ShippingAddress, :billing_address => Invoice::BillingAddress, :einvoice => Invoice::Einvoice});
        return invoices;
    end
    
    def differential_prices()
        differential_prices = get_list(:differential_prices, DifferentialPrice,
        {:tiers => DifferentialPrice::Tier, :parent_periods => DifferentialPrice::ParentPeriod});
        return differential_prices;
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
