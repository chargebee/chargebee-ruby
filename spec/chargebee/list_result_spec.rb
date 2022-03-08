require "spec_helper"

describe ChargeBee::ListResult do
  let(:response) do
    {:list=>
      [{:customer=>
         {:id=>"d0cus3orh6gnjgha1i",
          :first_name=>"Test Name1",
          :last_name=>"Test last name 1",
          :email=>"name1@gmail.com",
          :auto_collection=>"on",
          :created_at=>1346258514,
          :object=>"customer",
          :card_status=>"valid"},
        :card=>
         {:customer_id=>"d0cus3orh6gnjgha1i",
          :status=>"valid",
          :gateway=>"chargebee",
          :first_name=>"Test Name1",
          :last_name=>"Test last name 1",
          :iin=>"32122",
          :last4=>"1333",
          :card_type=>"visa",
          :expiry_month=>8,
          :expiry_year=>2013,
          :billing_addr1=>"Flat 11",
          :billing_addr2=>"51 Strit",
          :billing_city=>"Bristol",
          :billing_state=>"Somerset",
          :billing_zip=>"BS1 4HQ",
          :object=>"card",
          :masked_number=>"21323****4323"}},
       {:customer=>
         {:id=>"cwtid6smh67tq3z51l",
          :first_name=>"Test Name 2",
          :last_name=>"Test last name 2",
          :email=>"name2@gmail.com",
          :auto_collection=>"on",
          :created_at=>1345724673,
          :object=>"customer",
          :card_status=>"no_card"}}],
     :next_offset=>"[\"1345724673000\",\"1510\"]"}
  end

  before do
    ChargeBee::Rest.stubs(:request).returns(response)
  end

  it "returns list object, with next offset attribute" do
    list = ChargeBee::Request.send(:customer, "http://url.com", {:limit => 2})
    expect(list.next_offset) =~ ["1345724673000", "1510"]
  end
end
