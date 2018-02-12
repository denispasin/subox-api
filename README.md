# SuboxApi

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/subox_api`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'subox_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install subox_api

## Usage

### Initialization

```ruby
client = SuboxApi::Client.new(url: "http://0.0.0.0:3000", username: "XXX", password: "XXX")
```

The url is optional and by default target https://api.subox.co

### Response format

Each API response are wrapped into a Struct with preparsed body.
* **data**: contain a ruby object constructed with the JSON parse of the body
* **response**: contains the original Faraday response

### Boxes

```ruby
# Get all boxes
response = client.boxes.all
response.data = [{
  "id"=>"ff540b4a-8c41-428a-a176-7b16834efd07",
  "title"=>"spectral madness nameless",
  "description"=>"You want weapons? We're in a library! Books! The best weapons in the world!",
  "short_description"=>"unutterable swarthy charnel",
  "suggestion_type"=>"Hastur",
  "created_at"=>"2018-02-04T21:13:36.276Z",
  "created_by"=>"Skizzk"
  }]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/denispasin/subox_api.
