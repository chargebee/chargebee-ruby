require 'spec_helper'

describe 'ChargeBee::InvalidRequestError' do
  let(:invalid_request_json) do
    {
        message:  'id: The value chargebee_account is already present.',
        type: 'invalid_request',
        api_error_code: 'duplicate_entry',
        param: 'id',
        error_code: 'param_not_unique',
        error_msg: 'The value chargebee_account is already present.',
        error_param: 'id',
        http_status_code: 400
    }
  end

  it "provide message from error api response" do
    error = ChargeBee::InvalidRequestError.new(400, invalid_request_json)
    expect(error.message).to eq 'id: The value chargebee_account is already present.'
  end

end

