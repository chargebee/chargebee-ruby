require 'spec_helper'

describe ChargeBee::Request do
  class InjectTraceAdapter
    include ChargeBee::Telemetry::TelemetryAdapter

    def on_request_start(_context, request_headers)
      request_headers['traceparent'] = '00-test-trace'
      nil
    end

    def on_request_end(_handle, _result)
    end
  end

  it 'does not mutate caller headers when telemetry injects trace headers' do
    env = ChargeBee::Environment.new(
      api_key: 'test_key',
      site: 'acme',
      telemetry_adapter: InjectTraceAdapter.new,
    )
    original_headers = { 'chargebee-foo' => 'bar' }
    headers = original_headers.dup

    ChargeBee::NativeRequest.expects(:request).with do |_method, _url, _env, _params, merged_headers, *_rest|
      expect(merged_headers['traceparent']).to eq('00-test-trace')
      expect(merged_headers['chargebee-foo']).to eq('bar')
      true
    end.returns([{}, {}, '200'])

    ChargeBee::Request.send(
      'get',
      '/customers',
      {},
      env,
      headers,
      nil,
      false,
      {},
      {},
      telemetry_resource: 'customer',
      telemetry_operation: 'list',
    )

    expect(headers).to eq(original_headers)
    expect(headers).not_to have_key('traceparent')
  end

  it 'accepts nil headers when telemetry injects trace headers' do
    env = ChargeBee::Environment.new(
      api_key: 'test_key',
      site: 'acme',
      telemetry_adapter: InjectTraceAdapter.new,
    )

    ChargeBee::NativeRequest.expects(:request).with do |_method, _url, _env, _params, merged_headers, *_rest|
      expect(merged_headers['traceparent']).to eq('00-test-trace')
      true
    end.returns([{}, {}, '200'])

    ChargeBee::Request.send(
      'get',
      '/customers',
      {},
      env,
      nil,
      nil,
      false,
      {},
      {},
      'customer',
      'list',
    )
  end
end
