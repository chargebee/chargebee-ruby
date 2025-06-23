require 'spec_helper'
require 'zlib'
require 'stringio'

module ChargeBee
  describe NativeRequest do
    let(:env) do
      stub(
        api_key: "test_api_key",
        connect_timeout: 2,
        read_timeout: 5,
        retry_config: {
          enabled: true,
          max_retries: 2,
          delay_ms: 0.1,
          retry_on: [503, 429,504]
        },
        enable_debug_logs: false
      ).tap do |env_stub|
        env_stub.define_singleton_method(:api_url) do |url, subdomain|
          URI("https://#{subdomain || 'dummy'}.chargebee.com#{url}")
        end
      end
    end


    before do
      ChargeBee.stubs(:user_agent).returns("ChargeBee-TestAgent")
      ChargeBee.stubs(:verify_ca_certs?).returns(false)
    end

    it "sends a GET request with query params" do
      stub_request(:get, "https://dummy.chargebee.com/test").
        with(query: { "key" => "value" }).
        to_return(body: '{"result": "ok"}', status: 200, headers: { "Content-Type" => "application/json" })

      resp, headers, code = NativeRequest.request(:get, "/test", env, { "key" => "value" })

      expect(resp[:result]).to eq("ok")
      expect(code).to eq(200)
    end

    it "sends a POST request with URL-encoded payload" do
      stub_request(:post, "https://dummy.chargebee.com/test").
        with(body: "foo=bar").
        to_return(body: '{"success":true}', status: 200)

      resp, _, _ = NativeRequest.request(:post, "/test", env, { foo: "bar" })
      expect(resp[:success]).to eq(true)
    end

    it "sends a POST request with JSON payload when isJsonRequest=true" do
      stub_request(:post, "https://dummy.chargebee.com/test")
        .with(
          body: { foo: "bar" }.to_json,  # match raw JSON string
          headers: {
            'Accept' => 'application/json',
            'Content-Type' => 'application/json;charset=UTF-8',
            'User-Agent' => 'ChargeBee-TestAgent',
            'Lang-Version' => RUBY_VERSION,
            'OS-Version' => RUBY_PLATFORM,
            'Authorization' => "Basic #{Base64.strict_encode64('test_api_key:')}"
          }
        )
        .to_return(status: 200, body: '{"success":true}', headers: { 'Content-Type' => 'application/json' })

      resp, _, _ = NativeRequest.request(:post, "/test", env, { foo: "bar" }, {}, nil, true)
      expect(resp[:success]).to eq(true)
    end

    it "retries on 503 with exponential backoff" do
      stub_request(:get, "https://dummy.chargebee.com/test")
        .to_return(
          {
            status: 503,
            body: {
              message: "Sorry, something went wrong when trying to process the request.",
              type: "operation_failed",
              api_error_code: "internal_error",
              error_code: "internal_error",
              error_msg: "Sorry, something went wrong when trying to process the request.",
              http_status_code: 500
            }.to_json,
            headers: { 'Content-Type' => 'application/json' }
          },
          {
            status: 200,
            body: { ok: true }.to_json,
            headers: { 'Content-Type' => 'application/json' }
          }
        )

      resp, _, code = NativeRequest.request(:get, "/test", env, {})
      expect(resp[:ok]).to eq(true)
      expect(code).to eq(200)
    end

    it "handles gzip compressed response body" do
      raw_json = '{"gzipped":true}'
      compressed = StringIO.new
      gz = Zlib::GzipWriter.new(compressed)
      gz.write(raw_json)
      gz.close

      stub_request(:get, "https://dummy.chargebee.com/test").
        to_return(body: compressed.string, headers: { "Content-Encoding" => "gzip" }, status: 200)

      resp, _, _ = NativeRequest.request(:get, "/test", env)
      expect(resp[:gzipped]).to eq(true)
    end

    it "raises error for 503 with JSON-like content" do
      stub_request(:get, "https://dummy.chargebee.com/test").
        to_return(body: "503 Service Unavailable", status: 503)

      expect {
        NativeRequest.request(:get, "/test", env)
      }.to raise_error(Error, /503/)
    end

    it "raises specific error types based on response type field" do
      ["payment", "operation_failed", "invalid_request", "other"].each do |type|
        error_json = { type: type, message: "error", api_error_code: "code", http_status_code: 400 }.to_json
        stub_request(:get, "https://dummy.chargebee.com/test").
          to_return(body: error_json, status: 400)

        expect {
          NativeRequest.request(:get, "/test", env)
        }.to raise_error do |err|
          case type
          when "payment"
            expect(err).to be_a(PaymentError)
          when "operation_failed"
            expect(err).to be_a(OperationFailedError)
          when "invalid_request"
            expect(err).to be_a(InvalidRequestError)
          else
            expect(err).to be_a(APIError)
          end
        end
      end
    end

    it "retries once on HTTP 503 and succeeds on second attempt" do
      stub_request(:get, "https://dummy.chargebee.com/test")
        .to_return({ status: 503, body: "temporary error" },
                   { status: 200, body: '{"ok": true}', headers: { 'Content-Type' => 'application/json' } })

      resp, _, code = NativeRequest.request(:get, "/test", env)
      expect(resp[:ok]).to eq(true)
      expect(code).to eq(200)
    end

    it "uses Retry-After header if provided" do
      stub = stub_request(:get, "https://dummy.chargebee.com/test")
               .to_return(
                 { status: 429, headers: { "Retry-After" => "0" }, body: "{}" },
                 { status: 200, body: '{"done": true}', headers: { 'Content-Type' => 'application/json' } }
               )

      resp, _, code = NativeRequest.request(:get, "/test", env)

      expect(resp[:done]).to eq(true)
      expect(code).to eq(200)
      expect(stub).to have_been_requested.times(2)
    end

    it "raises after exhausting max_retries for retryable status codes" do
      stub_request(:get, "https://dummy.chargebee.com/test")
        .to_return(status: 503, body: "fail again")

      expect {
        NativeRequest.request(:get, "/test", env)
      }.to raise_error(Error, /503/)
    end

    it "retries on network errors like Timeout" do
      stub_request(:get, "https://dummy.chargebee.com/test")
        .to_timeout.then
        .to_return(status: 200, body: '{"hello":true}', headers: { 'Content-Type' => 'application/json' })

      resp, _, _ = NativeRequest.request(:get, "/test", env)
      expect(resp[:hello]).to eq(true)
    end

    it "retries on 504 and then succeeds" do
      stub_request(:get, "https://dummy.chargebee.com/test")
        .to_return(
          { status: 504, body: "gateway timeout" },
          { status: 200, body: '{"recovered":true}', headers: { 'Content-Type' => 'application/json' } }
        )

      resp, _, code = NativeRequest.request(:get, "/test", env)
      expect(resp[:recovered]).to eq(true)
      expect(code).to eq(200)
    end

  end
end