# UserActivity
The GDPR is forcing to use in mid of year 2017, I wanna have the tool out of the box to record the personal data accessing that can have some activity configuration.  

## Usage
User activity gem is a rails engine mountable gem working with "rails" and "rails admin". It's record all controller and action that user use into the database table itself.   

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'user_activity'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install user_activity
```

### Generate database table:
```bash
$ rails user_activity:install:migrations
```

### Mount route to application:
```ruby
Rails.application.routes.draw do
...
	mount RailsAdmin::Engine => '/user_activity', as: 'user_activity'
...
end
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
