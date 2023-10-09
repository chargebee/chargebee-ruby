# Chargebee Ruby Client Library - API V2

[![gem](https://img.shields.io/gem/v/chargebee.svg?maxAge=2)](https://rubygems.org/gems/chargebee)
[![gem](https://img.shields.io/gem/dtv/chargebee.svg?maxAge=2)](https://rubygems.org/gems/chargebee)

This is the Ruby Library for integrating with Chargebee. Sign up for a Chargebee account {here}[https://www.chargebee.com].

Chargebee now supports two API versions - [V1](https://apidocs.chargebee.com/docs/api/v1) and [V2](https://apidocs.chargebee.com/docs/api), of which V2 is the latest release and all future developments will happen in V2. This library is for <b>API version V2</b>. If you’re looking for V1, head to [chargebee-v1 branch](https://github.com/chargebee/chargebee-ruby/tree/chargebee-v1).

## Installation

Install the latest version of the gem with the following command...

    $ sudo gem install chargebee -v '~>2'


## Requirements

* Ruby 1.9.3 or above.
* rest-client

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

## License

See the LICENSE file.

