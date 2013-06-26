cloudmine
==============

[CloudMine](https://cloudmine.me) is a backend-as-a-service platform for
mobile and web developers to rapidly build and quickly scale their apps.
Build and scale iOS, Android, Windows Phone, and web apps on our secure
and managed backend.

This is a Ruby gem for interacting with the CloudMine API.

## Installation

Add this line to your application's Gemfile:

    gem 'cloudmine'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudmine

## Usage

Assign your credentials:

    Cloudmine.api_key = "my api key"
    Cloudmine.app_id  = "my app id"

# Objects

Create an object:

    Cloudmine::Object.create('key', { "field" => 'value' })

Fetch an object:

    object = Cloudmine::Object.fetch('key')

Update an object:

    Cloudmine::Object.update('key', 'new value')

Destroy an object:

    Cloudmine::Object.destroy('key')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
