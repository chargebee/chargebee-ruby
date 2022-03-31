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
       :addon_ids => ["addon_one", "addon_two"],
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
      "addons[quantity][0]"=>"2",
      "addons[id][1]"=>"ssl",
      "addon_ids[0]"=>"addon_one",
      "addon_ids[1]"=>"addon_two",
      "card[first_name]"=>"Rajaraman",
      "card[last_name]"=>"Santhanam",
      "card[number]"=>"4111111111111111",
      "card[expiry_month]"=>"1",
      "card[expiry_year]"=>"2024",
      "card[cvv]"=>"007"}
      expect(ChargeBee::Util.serialize(before)).to eq(after)
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
    expect(ChargeBee::Util.symbolize_keys(before)).to eq(after)
  end

  it "should properly convert the response json into proper object" do
    @request.expects(:execute).once.returns(mock_response(simple_subscription))
    result = ChargeBee::Subscription.retrieve("simple_subscription")
    s = result.subscription
    expect(s.id).to eq("simple_subscription")
    expect(s.plan_id).to eq('basic')
    c = result.customer
    expect(c.first_name).to eq('simple')
    expect(c.last_name).to eq('subscription')
  end

  it "should properly convert the nested response json into proper object with sub types" do
    @request.expects(:execute).once.returns(mock_response(nested_subscription))
    result = ChargeBee::Subscription.retrieve("nested_subscription")
    s = result.subscription
    expect(s.id).to eq("nested_subscription")
    a = s.addons
    expect(a.length).to eq(2)
    expect(a[0].id).to eq("monitor")
    expect(a[0].quantity).to eq("10")
    expect(a[1].id).to eq("ssl")
  end

  it "should properly convert the list response json into proper result object" do
    @request.expects(:execute).once.returns(mock_response(list_subscriptions))
    result = ChargeBee::Subscription.list({:limit => 2})
    expect(result.length).to eq(2)
    result.each do |i|
      expect(i.subscription.id).to eq('sample_subscription')
    end
  end

  it "should parse event api response and provide the content properly" do
    @request.expects(:execute).once.returns(mock_response(sample_event))
    result = ChargeBee::Event.retrieve("sample_event")
    event = result.event
    s = event.content.subscription
    expect(event.id).to eq('ev_KyVqDX__dev__NTgtUgx1')
    expect(s.id).to eq('sample_subscription')
  end

end

