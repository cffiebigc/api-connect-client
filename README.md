

# Api Connect Client [![Build Status](https://travis-ci.org/cffiebig/api-connect-client.svg?branch=master)](https://travis-ci.org/cffiebigc/api-connect-client) [![Gem Version](https://badge.fury.io/rb/api_connect_client.svg)](https://badge.fury.io/rb/api_connect_client)

This gem is used to interact with the [Developer Portal REST APIs](https://www.ibm.com/support/knowledgecenter/en/SSFS6T/com.ibm.apic.apirest.doc/dev_portal_apis.html)
 to perform some of the operations that are normally carried out in the Developer Portal UI.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'api_connect_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install api_connect_client

## Configuration

The Developer Portal REST APIs requires you to define a context with the form of `organization.space` where lives the catalog you are trying to interact with. In order to configure this gem you need to register the context:

```ruby
ApiConnectClient::Config.register_context("your_bluemix_context")
```

In rails you can create an initializer in config/initializers (e.g. api_connect_client.rb) and define your context.

The endpoint used to interact with this APIs is `https://us.apiconnect.ibmcloud.com/v1/portal` You can also register a custom endpoint like this:

```ruby
ApiConnectClient::Config.register_endpoint("your_custom_endpoint")
```

## Usage

Once you have configured your context you can interact with the APIs in two different ways:

* Manager:
  * Create users
  * List public products
  * Show an specific product

* Developer:
  * Create applications
  * List applications
  * Show an specific application
  * Update application information
  * Update application credentials
  * Subscribe application to a plan
  * List public APIs and a specific swagger spec

### Initialize manager

To interact as a manager you need to initialize it like this:

```ruby
manager = ApiConnectClient::Manager.new('manager_email', 'manager_password')
```

#### Create user

Then with the `manager` you can create a new user:

```ruby
manager.create_user(first_name, last_name, organization_name, username, password)
```

#### List public products

To list public products:

```ruby
manager.list_products
```

Which will return an array with the public products of your catalog with the following structure:

```json
[
  {
    "id": "5a0333569cf1b5ba87c1fd2f",
    "info": {
      "name": "product_name",
      "title": "Product Title",
      "version": "1.0.1",
      "description": "Product description"
    },
    "url": "https://us.apiconnect.ibmcloud.com/v1/portal/products/5a0333569cf1b5ba87c1fd2f",
    "status": "published"
  },
  {
    "id": "5a0333569cf1b5ba87c1fd2a",
    "info": {
      "name": "product_name",
      "title": "Product Title",
      "version": "1.0.1",
      "description": "Product description",
      "categories": [
        "mock"
      ]
    },
    "url": "https://us.apiconnect.ibmcloud.com/v1/portal/products/5a0333569cf1b5ba87c1fd2a",
    "status": "published"
  }
]
```

#### Show a product

If you want to retrieve an specific product you can call:

```ruby
manager.show_product(product_id)
```

### Initialize Developer

To interact as a developer you need to initialize it like this:

```ruby
developer = ApiConnectClient::Developer.new('developer_email', 'developer_password', 'organization_id')
```

#### Create applications

Then with the `developer` you can create a new application:

```ruby
developer.create_application(name, description, oauth_redirect_url, public_app = false)
```

#### List applications

List the applications owned by the developer:

```ruby
developer.list_applications
```

#### Show an specific application

```ruby
developer.show_application(app_id)
```

#### Update application information

```ruby
developer.update_application(app_id, name, description, oauth_redirect_uri, public_app)
```

#### Update application credentials

```ruby
developer.update_application_credentials(app_id, client_id, client_secret)
```

#### Subscribe application to a plan

```ruby
developer.subscribe_application(app_id, product_id, plan = 'default')
```

#### List API and a specific swagger spec
```ruby
api.list_public_apis
```

```ruby
api.get_swagger_from_public_api "5a956c490cf23b2cf8eacfbe"
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/api-connect-client.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
