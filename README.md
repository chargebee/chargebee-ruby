# Chargebee Ruby Client Library - API V2

[![gem](https://img.shields.io/gem/v/chargebee.svg?maxAge=2)](https://rubygems.org/gems/chargebee)
[![gem](https://img.shields.io/gem/dtv/chargebee.svg?maxAge=2)](https://rubygems.org/gems/chargebee)

> [!NOTE]
> [![Join Discord](https://img.shields.io/badge/Discord-Early%20Access-blue?logo=discord&logoColor=white)](https://discord.gg/S3SXDzXHAg)
>
> We are trialing a Discord server for developers building with Chargebee. Limited spots are open on a first-come basis. Join [here](https://discord.gg/S3SXDzXHAg) if interested.


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

## License

See the LICENSE file.

