require 'spec_helper'

module ChargeBee
  class RecordingTelemetryAdapter
    include Telemetry::TelemetryAdapter

    attr_reader :events, :start_context, :end_result

    def initialize
      @events = []
    end

    def on_request_start(context, request_headers)
      @events << 'start'
      @start_context = context
      request_headers['traceparent'] = '00-test-trace'
      'span-1'
    end

    def on_request_end(handle, result)
      @events << 'end'
      @end_result = result
    end
  end
end

describe ChargeBee::TelemetryExecutor do
  let(:env) do
    ChargeBee::Environment.new(api_key: 'test_key', site: 'acme')
  end

  it 'skips telemetry when no adapter is configured' do
    result = ChargeBee::TelemetryExecutor.execute(
      env,
      telemetry_resource: 'customer',
      telemetry_operation: 'list',
      method: 'get',
      http_url: 'https://acme.chargebee.com/api/v2/customers',
    ) do |headers|
      expect(headers).to be_nil
      [200, :ok]
    end

    expect(result).to eq(:ok)
  end

  it 'skips telemetry when resource or operation metadata is missing' do
    adapter = ChargeBee::RecordingTelemetryAdapter.new
    env.telemetry_adapter = adapter

    result = ChargeBee::TelemetryExecutor.execute(
      env,
      telemetry_resource: '',
      telemetry_operation: 'list',
      method: 'get',
      http_url: 'https://acme.chargebee.com/api/v2/customers',
    ) do |_headers|
      [200, :ok]
    end

    expect(result).to eq(:ok)
    expect(adapter.events).to be_empty
  end

  it 'calls adapter once per request and injects trace headers' do
    adapter = ChargeBee::RecordingTelemetryAdapter.new
    env.telemetry_adapter = adapter

    result = ChargeBee::TelemetryExecutor.execute(
      env,
      telemetry_resource: 'customer',
      telemetry_operation: 'list',
      method: 'get',
      http_url: 'https://acme.chargebee.com/api/v2/customers',
    ) do |headers|
      expect(headers['traceparent']).to eq('00-test-trace')
      [200, :ok]
    end

    expect(result).to eq(:ok)
    expect(adapter.events).to eq(%w[start end])
    expect(adapter.start_context.span_name).to eq('chargebee.customer.list')
    expect(adapter.end_result.http_status_code).to eq(200)
  end

  it 'captures chargebee-* request headers and excludes the PII origin family' do
    adapter = ChargeBee::RecordingTelemetryAdapter.new
    env.telemetry_adapter = adapter
    request_headers = {
      'chargebee-foo' => 'bar',
      'Chargebee-Idempotency-Key' => 'idem-key-1',
      'Authorization' => 'Basic super-secret',
      'chargebee-request-origin-ip' => '202.170.207.70',
    }

    ChargeBee::TelemetryExecutor.execute(
      env,
      telemetry_resource: 'customer',
      telemetry_operation: 'list',
      method: 'get',
      http_url: 'https://acme.chargebee.com/api/v2/customers',
      request_headers: request_headers,
    ) do |_headers|
      [200, :ok]
    end

    attrs = adapter.start_context.start_attributes
    expect(attrs['http.request.header.chargebee-foo']).to eq('bar')
    expect(attrs['http.request.header.chargebee-idempotency-key']).to eq('idem-key-1')
    expect(attrs['http.request.header.authorization']).to be_nil
    expect(attrs['http.request.header.chargebee-request-origin-ip']).to be_nil
    expect(attrs.to_s).not_to include('202.170.207.70')
  end

  it 'records chargebee API errors on failure' do
    adapter = ChargeBee::RecordingTelemetryAdapter.new
    env.telemetry_adapter = adapter
    api_error = ChargeBee::InvalidRequestError.new(
      404,
      {
        message: 'Not found',
        type: 'invalid_request',
        api_error_code: 'resource_not_found',
        param: 'customer_id',
      },
    )

    expect do
      ChargeBee::TelemetryExecutor.execute(
        env,
        telemetry_resource: 'customer',
        telemetry_operation: 'retrieve',
        method: 'get',
        http_url: 'https://acme.chargebee.com/api/v2/customers/1',
      ) do |_headers|
        raise api_error
      end
    end.to raise_error(api_error)

    expect(adapter.events).to eq(%w[start end])
    expect(adapter.end_result.http_status_code).to eq(404)
    expect(adapter.end_result.error.chargebee_error_code).to eq('resource_not_found')
    expect(adapter.end_result.end_attributes['error.type']).to eq('invalid_request')
    expect(adapter.end_result.end_attributes['chargebee.error.type']).to eq('invalid_request')
    expect(adapter.end_result.end_attributes['error.type']).not_to eq('404')
  end
end
