
def api_index_urls()
  {
    :urls => ["http://mannar-test.localcb.com:8080/api/v1/subscriptions",
    "http://mannar-test.localcb.com:8080/api/v1/customers",
    "http://mannar-test.localcb.com:8080/api/v1/cards",
    "http://mannar-test.localcb.com:8080/api/v1/invoices",
    "http://mannar-test.localcb.com:8080/api/v1/transactions",
    "http://mannar-test.localcb.com:8080/api/v1/hosted_pages",
    "http://mannar-test.localcb.com:8080/api/v1/events"],
    :version => "v2"
  }
end

def simple_subscription
  {
    :subscription => {
      :id => 'simple_subscription',
      :plan_id => 'basic'
    },
    :customer => {
      :first_name => 'simple',
      :last_name => 'subscription'
    }
  }
end

def nested_subscription
  {
    :subscription => {
      :id => 'nested_subscription',
      :plan_id => 'basic',
      :addons => [
        {:id => 'monitor', :quantity => '10'},
        {:id => 'ssl'}
        ]
    }
  }
end

def test_subscription
  {
    :subscription => {
      :id => "sample_subscription",
      :plan_id => "basic"
      }
  }
end

def list_subscriptions()
  {:list => [test_subscription, test_subscription]}
end

def sample_event()
  {:event => {
      :id => 'ev_KyVqDX__dev__NTgtUgx1',
      :occurred_at => 1325356232,
      :event_type => "payment_collected",
      :webhook_status => "succeeded",
      :content => {
          :subscription => {
              :id => 'sample_subscription',
              :plan_id => 'basic',
              :plan_quantity=> 1,
          },
          :customer => {
              :first_name => "Sample",
              :last_name => "Subscription",
          },
      }
    }
  }
end
