# Chargebee Ruby Client Library - API V2

[![gem](https://img.shields.io/gem/v/chargebee.svg?maxAge=2)](https://rubygems.org/gems/chargebee)
[![gem](https://img.shields.io/gem/dtv/chargebee.svg?maxAge=2)](https://rubygems.org/gems/chargebee)

> [!NOTE]
> [![Join Discord](https://img.shields.io/badge/Discord-Early%20Access-blue?logo=discord&logoColor=white)](https://discord.gg/S3SXDzXHAg)
>
> We are trialing a Discord server for developers building with Chargebee. Limited spots are open on a first-come basis. Join [here](https://discord.gg/gpsNqnhDm2) if interested.


This is the official Ruby library for integrating with Chargebee.

- 📘 For a complete reference of available APIs, check out our [API Documentation](https://apidocs.chargebee.com/docs/api/?lang=ruby).  
- 🧪 To explore and test API capabilities interactively, head over to our [API Explorer](https://api-explorer.chargebee.com).

> Note: Chargebee now supports two API versions - [V1](https://apidocs.chargebee.com/docs/api/v1) and [V2](https://apidocs.chargebee.com/docs/api), of which V2 is the latest release and all future developments will happen in V2. This library is for <b>API version V2</b>. If you’re looking for V1, head to [chargebee-v1 branch](https://github.com/chargebee/chargebee-ruby/tree/chargebee-v1).

## Installation

Install the latest version of the gem with the following command...

    $ sudo gem install chargebee -v '~>2'


## Requirements

* Ruby 1.9.3 or above.

## Documentation

See our [Ruby API Reference](https://apidocs.chargebee.com/docs/api?lang=ruby "API Reference").

## Usage

### To create a new subscription:

```ruby
ChargeBee.configure({:api_key => "your_api_key" , :site => "your_site"})
result = ChargeBee::Subscription.create({
	:id => "sub_KyVqDh__dev__NTn4VZZ1", 
	:plan_id => "basic", 
})
subscription = result.subscription
puts "created subscription is #{subscription}"
```

### Create an Idempotent Request

[Idempotency keys](https://apidocs.chargebee.com/docs/api/idempotency?prod_cat_ver=2) are passed along with request headers to allow a safe retry of POST requests. 

```ruby
require 'chargebee'
ChargeBee.configure({:api_key => "your_api_key" , :site => "your_site"})
result = ChargeBee::Customer.create({
  :first_name => "John",
  :last_name => "Doe",
  :email => "john@test.com",
  :locale => "fr-CA",
  :billing_address => {
    :first_name => "John",
    :last_name => "Doe",
    :line1 => "PO Box 9999",
    :city => "Walnut",
    :state => "California",
    :zip => "91789",
    :country => "US"
    }
  },
  nil,
  {"chargebee-idempotency-key" => "<<UUID>>"} # Replace <<UUID>> with a unique string
)
customer = result.customer
card = result.card
responseHeader = result.get_response_headers # Retrieves response headers
puts(responseHeader)
idempotencyReplayedValue = result.is_idempotency_replayed # Retrieves Idempotency replayed header value
puts(idempotencyReplayedValue)
```
`is_idempotency_replayed` method can be accessed to differentiate between original and replayed requests.


### Retry Handling

Chargebee's SDK includes built-in retry logic to handle temporary network issues and server-side errors. This feature is **disabled by default** but can be **enabled when needed**.

#### Key features include:

- **Automatic retries for specific HTTP status codes**: Retries are automatically triggered for status codes `500`, `502`, `503`, and `504`.
- **Exponential backoff**: Retry delays increase exponentially to prevent overwhelming the server.
- **Rate limit management**: If a `429 Too Many Requests` response is received with a `Retry-After` header, the SDK waits for the specified duration before retrying.
  > *Note: Exponential backoff and max retries do not apply in this case.*
- **Customizable retry behavior**: Retry logic can be configured using the `retryConfig` parameter in the environment configuration.

#### Example: Customizing Retry Logic

You can enable and configure the retry logic by passing a `retryConfig` object when initializing the Chargebee environment:

```ruby
require 'chargebee'
ChargeBee.configure({:api_key => "your_api_key" , :site => "your_site"})

# Set comprehensive retry configuration
ChargeBee::default_env.retry_config = {
  enabled: true,
  max_retries: 1,
  delay_ms: 2000,
  retry_on: [500]
}

# ... your Chargebee API operations ...

```

#### Example: Rate Limit retry logic

You can enable and configure the retry logic for rate-limit by passing a `retryConfig` object when initializing the Chargebee environment:

```ruby
require 'chargebee'
ChargeBee.configure({:api_key => "your_api_key" , :site => "your_site"})

# Set comprehensive retry configuration
ChargeBee::default_env.retry_config = {
  enabled: true,
  max_retries: 1,
  delay_ms: 1000,
  retry_on: [429]
}

# ... your Chargebee API operations ...
```

### Telemetry (OpenTelemetry)

**Optional add-on.** Existing integrations do not need any changes — if you never set a telemetry adapter, API calls behave exactly as before.

Pass a `telemetry_adapter` when you want Chargebee API calls traced in your observability stack (Datadog, Splunk, Honeycomb, Jaeger, etc.). OpenTelemetry is **not** bundled with the `chargebee` gem — install and configure OTel (or your APM SDK) in your application, implement `ChargeBee::Telemetry::TelemetryAdapter`, and wire it on the environment.

The SDK builds standardized span attributes (`start_attributes`, `end_attributes`) following stable [OpenTelemetry HTTP semantic conventions](https://opentelemetry.io/docs/specs/semconv/http/http-spans/) (`url.full`, `http.request.method`, `http.response.status_code`, `server.address`, `error.type`) plus Chargebee-specific `chargebee.*` attributes (see constants in `ChargeBee::Telemetry::TelemetryAttributeKeys`).

Span names follow `chargebee.{resource}.{operation}` (for example, `chargebee.customer.create`). One span is created per SDK API call; retries reuse the same span. Adapter failures are logged and never affect the underlying API request.

Configure at startup — pass `telemetry_adapter` in the same `ChargeBee.configure` call. `configure` replaces the default environment, so calling it again without `telemetry_adapter` drops a previously configured adapter:

```ruby
require 'chargebee'

class MyTelemetryAdapter
  include ChargeBee::Telemetry::TelemetryAdapter

  def on_request_start(context, request_headers)
    # Start a span using context.start_attributes and inject trace headers into request_headers
    nil
  end

  def on_request_end(handle, result)
    # End the span using result.end_attributes
  end
end

ChargeBee.configure(
  api_key: 'your_api_key',
  site: 'your_site',
  telemetry_adapter: MyTelemetryAdapter.new,
)
```

If you pass a custom `ChargeBee::Environment` into resource methods as `env`, set `telemetry_adapter` on that instance — `ChargeBee.configure` only updates the default environment:

```ruby
env = ChargeBee::Environment.new(
  api_key: 'your_api_key',
  site: 'your_site',
  telemetry_adapter: MyTelemetryAdapter.new,
)

ChargeBee::Customer.list({}, env)
```

To pass custom `chargebee-*` headers (promoted to `http.request.header.chargebee-*` span attributes), include them in the `headers` argument on resource methods:

```ruby
ChargeBee::Customer.list({}, nil, { 'chargebee-business-entity-id' => 'entity-id' })
```

## License

See the LICENSE file.

