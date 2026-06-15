require 'uri'

module ChargeBee
  class TelemetryExecutor
    class << self
      def execute(env, telemetry_resource:, telemetry_operation:, method:, http_url:)
        adapter = env.telemetry_adapter
        if adapter.nil? || telemetry_resource.to_s.empty? || telemetry_operation.to_s.empty?
          _status, result = yield(nil)
          return result
        end

        start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        headers = {}
        handle = start_telemetry(env, adapter, telemetry_resource, telemetry_operation, method, http_url, headers)

        begin
          telemetry_headers = headers.empty? ? nil : headers
          status_code, result = yield(telemetry_headers)
          end_telemetry_success(adapter, handle, start, status_code)
          result
        rescue => err
          end_telemetry_failure(adapter, handle, start, err)
          raise
        end
      end

      def build_http_url(env, sub_domain, url)
        path = url.start_with?('/') ? url : "/#{url}"
        full = env.api_url(path, sub_domain)
        uri = URI.parse(full)
        "#{uri.scheme}://#{uri.host}#{uri.path}"
      end

      private

      def start_telemetry(env, adapter, resource, operation, method, http_url, headers)
        uri = URI.parse(http_url)
        host = uri.host || ''
        api_path = "/api/#{Environment::API_VERSION}"
        context = Telemetry::TelemetrySupport.build_request_telemetry_context(
          resource,
          operation,
          method.to_s.upcase,
          http_url,
          host,
          env.site,
          Telemetry::TelemetrySupport.resolve_chargebee_api_version(api_path),
          ChargeBee::VERSION,
        )
        safe_on_request_start(env, adapter, context, headers)
      end

      def end_telemetry_success(adapter, handle, start, http_status_code)
        duration_ms = elapsed_ms(start)
        result = Telemetry::TelemetrySupport.build_request_telemetry_result(http_status_code, duration_ms, nil)
        safe_on_request_end(adapter, handle, result)
      end

      def end_telemetry_failure(adapter, handle, start, err)
        status_code = Telemetry::TelemetrySupport.extract_http_status_code(err) || 500
        duration_ms = elapsed_ms(start)
        telemetry_error = Telemetry::TelemetrySupport.extract_request_telemetry_error(err)
        result = Telemetry::TelemetrySupport.build_request_telemetry_result(status_code, duration_ms, telemetry_error)
        safe_on_request_end(adapter, handle, result)
      end

      def safe_on_request_start(env, adapter, context, headers)
        adapter.on_request_start(context, headers)
      rescue => err
        log_telemetry_error(env, 'on_request_start', err)
        nil
      end

      def safe_on_request_end(adapter, handle, result)
        adapter.on_request_end(handle, result)
      rescue => err
        warn "[ChargeBee] Telemetry adapter on_request_end failed: #{err}"
      end

      def log_telemetry_error(env, phase, err)
        return unless env.enable_debug_logs

        warn "[ChargeBee] Telemetry adapter #{phase} failed: #{err}. Continuing without telemetry."
      end

      def elapsed_ms(start)
        ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - start) * 1000).round
      end
    end
  end
end
