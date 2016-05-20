module ChargeBee
  class Result

    def initialize(response)
      @response = response
    end
    
    def subscription() 
        subscription = get(:subscription, Subscription,
        {:addons => Subscription::Addon, :coupons => Subscription::Coupon, :shipping_address => Subscription::ShippingAddress});
        return subscription;
    end

    def customer() 
        customer = get(:customer, Customer,
        {:billing_address => Customer::BillingAddress, :contacts => Customer::Contact, :payment_method => Customer::PaymentMethod});
        return customer;
    end

    def card() 
        card = get(:card, Card);
        return card;
    end

    def invoice() 
        invoice = get(:invoice, Invoice,
        {:line_items => Invoice::LineItem, :discounts => Invoice::Discount, :taxes => Invoice::Tax, :line_item_taxes => Invoice::LineItemTax, :linked_payments => Invoice::LinkedPayment, :applied_credits => Invoice::AppliedCredit, :adjustment_credit_notes => Invoice::AdjustmentCreditNote, :issued_credit_notes => Invoice::IssuedCreditNote, :linked_orders => Invoice::LinkedOrder, :notes => Invoice::Note, :shipping_address => Invoice::ShippingAddress, :billing_address => Invoice::BillingAddress});
        return invoice;
    end

    def credit_note() 
        credit_note = get(:credit_note, CreditNote,
        {:line_items => CreditNote::LineItem, :discounts => CreditNote::Discount, :taxes => CreditNote::Tax, :line_item_taxes => CreditNote::LineItemTax, :linked_refunds => CreditNote::LinkedRefund, :allocations => CreditNote::Allocation});
        return credit_note;
    end

    def order() 
        order = get(:order, Order);
        return order;
    end

    def transaction() 
        transaction = get(:transaction, Transaction,
        {:linked_invoices => Transaction::LinkedInvoice, :linked_credit_notes => Transaction::LinkedCreditNote, :linked_refunds => Transaction::LinkedRefund});
        return transaction;
    end

    def hosted_page() 
        hosted_page = get(:hosted_page, HostedPage);
        return hosted_page;
    end

    def estimate() 
        estimate = get(:estimate, Estimate, {},
        {:subscription_estimate => SubscriptionEstimate, :invoice_estimate => InvoiceEstimate, :credit_note_estimates => CreditNoteEstimate});
        estimate.init_dependant(@response[:estimate], :subscription_estimate,
        {});
        estimate.init_dependant(@response[:estimate], :invoice_estimate,
        {:line_items => InvoiceEstimate::LineItem, :discounts => InvoiceEstimate::Discount, :taxes => InvoiceEstimate::Tax, :line_item_taxes => InvoiceEstimate::LineItemTax});
        estimate.init_dependant_list(@response[:estimate], :credit_note_estimates,
        {:line_items => CreditNoteEstimate::LineItem, :discounts => CreditNoteEstimate::Discount, :taxes => CreditNoteEstimate::Tax, :line_item_taxes => CreditNoteEstimate::LineItemTax});
        return estimate;
    end

    def plan() 
        plan = get(:plan, Plan);
        return plan;
    end

    def addon() 
        addon = get(:addon, Addon);
        return addon;
    end

    def coupon() 
        coupon = get(:coupon, Coupon);
        return coupon;
    end

    def coupon_code() 
        coupon_code = get(:coupon_code, CouponCode);
        return coupon_code;
    end

    def address() 
        address = get(:address, Address);
        return address;
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


    def credit_notes()
        credit_notes = get_list(:credit_notes, CreditNote,
        {:line_items => CreditNote::LineItem, :discounts => CreditNote::Discount, :taxes => CreditNote::Tax, :line_item_taxes => CreditNote::LineItemTax, :linked_refunds => CreditNote::LinkedRefund, :allocations => CreditNote::Allocation});
        return credit_notes;
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

    def to_s(*args) 
      JSON.pretty_generate(@response) 
    end

  end
end
