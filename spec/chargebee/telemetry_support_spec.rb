require 'spec_helper'

describe ChargeBee::Telemetry::TelemetrySupport do
  describe '.build_request_end_span_attributes' do
    it 'uses chargebee error type for error.type' do
      error = ChargeBee::Telemetry::RequestTelemetryError.new(
        message: 'Not found',
        chargebee_error_code: 'resource_not_found',
        chargebee_api_error_type: 'invalid_request',
      )

      attributes = described_class.build_request_end_span_attributes(404, error)

      expect(attributes[ChargeBee::Telemetry::TelemetryAttributeKeys::HTTP_RESPONSE_STATUS_CODE]).to eq(404)
      expect(attributes[ChargeBee::Telemetry::TelemetryAttributeKeys::ERROR_TYPE]).to eq('invalid_request')
      expect(attributes[ChargeBee::Telemetry::TelemetryAttributeKeys::CHARGEBEE_ERROR_TYPE]).to eq('invalid_request')
    end

    it 'omits error.type when chargebee error classification is unavailable' do
      error = ChargeBee::Telemetry::RequestTelemetryError.new(message: 'request failed')

      attributes = described_class.build_request_end_span_attributes(500, error)

      expect(attributes[ChargeBee::Telemetry::TelemetryAttributeKeys::HTTP_RESPONSE_STATUS_CODE]).to eq(500)
      expect(attributes).not_to have_key(ChargeBee::Telemetry::TelemetryAttributeKeys::ERROR_TYPE)
      expect(attributes).not_to have_key(ChargeBee::Telemetry::TelemetryAttributeKeys::CHARGEBEE_ERROR_TYPE)
    end
  end
end
