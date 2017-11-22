# Be sure to restart your server when you modify this file.

# This file contains configurฟะรนื settings for UserActivity

UserActivity.configure do |config|
	# Load activity define from yml file to configuration
	# you can change activity define file path ans name here, by default we use the file that generated from gem 
	config.activity_define = YAML.load_file("#{Rails.root.to_s}/config/user_activity.yml") || {}
end