$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_blog_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_blog_engine"
  s.version     = RailsBlogEngine::VERSION
  s.authors     = ["Eric Kidd"]
  s.email       = ["eric@kiddsoftware.com"]
  s.homepage    = "http://github.com/kiddsoftware/rails_blog_engine"
  s.summary     = "Rails 3.1 drop-in blog engine"
  s.description = "Rails 3.1 drop-in blog engine for existing Rails applications"

  s.files         = `git ls-files`.split("\n").sort
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # Rails 3.1.
  s.add_dependency "rails", "~> 3.2.0"

  # Asset pipeline.  We use all the standard gems plus HAML.
  s.add_dependency "jquery-rails", "~> 2.1"
  s.add_dependency "sass-rails", "~> 3.2"
  s.add_dependency "coffee-script", "~> 2.2"
  s.add_dependency "haml"

  # Pagination.
  s.add_dependency "kaminari", "~> 0.12.4"

  # User accounts and authentication.
  s.add_dependency "cancan", "~> 1.6"

  # Spam filtering.
  s.add_dependency "rakismet", "~> 1.1"

  # Other useful libraries.
  s.add_dependency "simple_form", "~> 1.4"
  s.add_dependency "state_machine", "~> 1.0.0"
  s.add_dependency "rdiscount", "~> 1.6"
  s.add_dependency "sanitize", "~> 2.0"

  # Development-only gems.
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "devise"
  s.add_development_dependency "steak"
  s.add_development_dependency "foreman"
  s.add_development_dependency "capybara-webkit", "~> 0.6.1"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "generator_spec"
  s.add_development_dependency "vcr", ">= 2.0.0.beta2"
  s.add_development_dependency "fakeweb"
  #s.add_development_dependency "machinist" (see Gemfile)
  #s.add_development_dependency "pygments" (see Gemfile)

  # Auto-running our unit tests when things change.
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rb-inotify"
  s.add_development_dependency "libnotify"
  s.add_development_dependency "launchy"
end
