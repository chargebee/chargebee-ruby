module ChargeBee
  class Result

    def initialize(response)
      @response = response
    end
    
    def subscription() 
        get(:subscription, Subscription, 
        {:addons => Subscription::Addon, :coupons => Subscription::Coupon, :shipping_address => Subscription::ShippingAddress});
    end

    def customer() 
        get(:customer, Customer, 
        {:billing_address => Customer::BillingAddress, :contacts => Customer::Contact, :payment_method => Customer::PaymentMethod});
    end

    def card() 
        get(:card, Card);
    end

    def invoice() 
        get(:invoice, Invoice, 
        {:line_items => Invoice::LineItem, :discounts => Invoice::Discount, :taxes => Invoice::Tax, :linked_transactions => Invoice::LinkedTransaction, :linked_orders => Invoice::LinkedOrder, :notes => Invoice::Note, :shipping_address => Invoice::ShippingAddress, :billing_address => Invoice::BillingAddress});
    end

    def order() 
        get(:order, Order);
    end

    def transaction() 
        get(:transaction, Transaction, 
        {:linked_invoices => Transaction::LinkedInvoice, :linked_refunds => Transaction::LinkedRefund});
    end

    def hosted_page() 
        get(:hosted_page, HostedPage);
    end

    def estimate() 
        get(:estimate, Estimate, 
        {:line_items => Estimate::LineItem, :discounts => Estimate::Discount, :taxes => Estimate::Tax});
    end

    def plan() 
        get(:plan, Plan);
    end

    def addon() 
        get(:addon, Addon);
    end

    def coupon() 
        get(:coupon, Coupon);
    end

    def coupon_code() 
        get(:coupon_code, CouponCode);
    end

    def address() 
        get(:address, Address);
    end

    def event() 
        get(:event, Event, 
        {:webhooks => Event::Webhook});
    end

    def comment() 
        get(:comment, Comment);
    end

    def download() 
        get(:download, Download);
    end

    def portal_session() 
        get(:portal_session, PortalSession, 
        {:linked_customers => PortalSession::LinkedCustomer});
    end



    private
    def get(type, klass, sub_types = {})
      klass.construct(@response[type], sub_types)
    end

    def to_s(*args) 
      JSON.pretty_generate(@response) 
    end

  end
end
