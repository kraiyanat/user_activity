$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_activity/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_activity"
  s.version     = UserActivity::VERSION
  s.authors     = ["Kraiyanat Chomchumpol"]
  s.email       = ["kraiyanat@gmail.com"]
  s.homepage    = ""
  s.summary     = "Rails engine mountable gem to tracking user activities"
  s.description = "Easy to use gem, tracking all activity that user done and come with the modern user interface 'rails admin' "
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"
  s.add_dependency "rails_admin", "~> 1.2"

  s.add_development_dependency "sqlite3"
end
