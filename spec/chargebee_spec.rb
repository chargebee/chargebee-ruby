require 'spec_helper'
require 'rest_client'
require 'sample_response'

describe "chargebee" do
  
  before(:all) do
    @request = RestClient::Request
  end
  
  it "serialize should convert the hash to acceptable format" do
    before = {
      :id => "sub_KyVq7DNSNM7CSD",
      :plan_id => "free",
       :addons => [{:id => "monitor", :quantity => 2}, {:id => "ssl"}],
       :card => {
         :first_name => "Rajaraman",
         :last_name => "Santhanam",
         :number => "4111111111111111",
         :expiry_month => "1",
         :expiry_year => "2024",
         :cvv => "007"
       }
    }
    after = {
      "id"=>"sub_KyVq7DNSNM7CSD", 
      "plan_id"=>"free", 
      "addons[id][0]"=>"monitor", 
      "addons[quantity][0]"=>2, 
      "addons[id][1]"=>"ssl", 
      "card[first_name]"=>"Rajaraman", 
      "card[last_name]"=>"Santhanam", 
      "card[number]"=>"4111111111111111", 
      "card[expiry_month]"=>"1", 
      "card[expiry_year]"=>"2024", 
      "card[cvv]"=>"007"}
      ChargeBee::Util.serialize(before).should eq(after)
  end
  
  it "symbolize_keys should convert keys to symbols" do
    before = {
      'id' => 'sub_KyVq4P__dev__NTWxbJx1',
      'plan_id' => 'basic',
      'addons' => [{ 'id' => 'ssl' }, {'id' => 'sms', 'quantity' => '10'}]
    }
    after = {
      :id => 'sub_KyVq4P__dev__NTWxbJx1',
      :plan_id => 'basic',
      :addons => [{ :id => 'ssl' }, {:id => 'sms', :quantity => '10'}],
    }
    ChargeBee::Util.symbolize_keys(before).should eq(after)
  end
   
  it "should properly convert the response json into proper object" do
    @request.expects(:execute).once.returns(mock_response(simple_subscription))
    result = ChargeBee::Subscription.retrieve("simple_subscription")
    s = result.subscription
    s.id.should eq("simple_subscription")
    s.plan_id.should eq('basic')
    c = result.customer
    c.first_name.should eq('simple')
    c.last_name.should eq('subscription')
  end
  
  it "should properly convert the nested response json into proper object with sub types" do
    @request.expects(:execute).once.returns(mock_response(nested_subscription))
    result = ChargeBee::Subscription.retrieve("nested_subscription")
    s = result.subscription
    s.id.should eq("nested_subscription")
    a = s.addons
    a.length.should eq(2)
    a[0].id.should eq("monitor")
    a[0].quantity.should eq("10")
    a[1].id.should eq("ssl")
  end
  
  it "should properly convert the list response json into proper result object" do
    @request.expects(:execute).once.returns(mock_response(list_subscriptions))
    result = ChargeBee::Subscription.list({:limit => 2})
    result.length.should eq(2)
    result.each do |i|
      i.subscription.id.should eq('sample_subscription')
    end
  end
  
  it "should parse event api response and provide the content properly" do
    @request.expects(:execute).once.returns(mock_response(sample_event))
    result = ChargeBee::Event.retrieve("sample_event")
    event = result.event
    s = event.content.subscription
    event.id.should eq('ev_KyVqDX__dev__NTgtUgx1')
    s.id.should eq('sample_subscription')
  end
  
  it "should raise APIError when error response is received" do
    response = mock_response(sample_error, 400)
    begin
      @request.expects(:execute).once.raises(RestClient::ExceptionWithResponse.new(response, 400))
      ChargeBee::Subscription.create({:id => "invalid_subscription"})
    rescue ChargeBee::APIError => e
      e.http_code.should eq(400)
    end
  end
  
end

