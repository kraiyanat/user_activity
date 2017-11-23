# UserActivity
The GDPR is forcing to use in mid of year 2017, I wanna have the tool out of the box to record the personal data accessing that can have some activity configuration.  

## Usage
User activity gem is a rails engine mountable gem working with "rails" and "rails admin". It's record all controller and action that user use into the database table itself.   

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'user_activity'
gem 'rails_admin', '~> 1.2 #the dependency gem
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
And then execute:
```bash
$ rake db:migrate
```

### Mount route to application:
```ruby
Rails.application.routes.draw do
...
	mount RailsAdmin::Engine => '/user_activity', as: 'user_activity'
...
end
```
### Install initializer files by command below: 
In order to make the gem work, there is a few think to do following below. 

##Configuration
It is posible to config some data in this gem, to do that you can follow the example below:

### Add before_action to enable recording activities
In case you want to enable to all controller in your application, you can add code to ApplicationController.
```ruby
class ApplicationController < ActionController::Base
...
	before_action :log_user_activity
...
end
```

### To provide user name and user id you need to override controller method "user_for_user_activity"
Override the method name 'user_for_user_activity'in controller which is return object of Struct with attribures 'name' and 'id'. For example in case using Devise.
```ruby
class ApplicationController < ActionController::Base
...
	def user_for_user_activity
  		Struct.new(:name, :id).new(current_user.email, current_user.id)
	end
...
end
```

### Define activity name
To define activity name and record to database, need to run the command below:
```bash
$ rails generate installer user_activity
```
That will create 2 files.
- config/initializers/user_activity.rb
- config/user_activity.yml

First is config/initializer/user_activity.rb configuration file that load yml to configuration attribute, the second is  config/user_activity.yml this file store activity define and you can define the activity here.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
