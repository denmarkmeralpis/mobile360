# Mobile360

A Ruby wrapper for Mobile360 APIs.

### Contents
1. SMS
   * Broadcast
   * DLR(Todo)
   * MO Routing

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mobile360'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install mobile360

## Usage
### Broadcast
```ruby
client = Mobile360::SMS::Broadcast.new(
    username: 'username',
    password: 'securepassword',
    msisdn: '63917XXXXXXX',
    content: 'Hi, your OTP is: 12345',
    shortcode_mask: 'TEST'
)

response = client.call
```

If you want to raise an exception every unsuccessful delivery use: `#call!`


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mobile360. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/mobile360/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mobile360 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/mobile360/blob/master/CODE_OF_CONDUCT.md).
