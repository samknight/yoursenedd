source 'http://rubygems.org'
ruby '2.3.1'

gem 'rails', '~>4.2'
gem 'mysql2', '~> 0.3.20'

gem 'dotenv-rails'

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

gem 'jquery-rails'
gem 'mountain_view'

gem 'json'
gem 'paperclip'
gem 'nokogiri'
gem 'devise'

gem 'exception_notification'

gem 'assembly_wales', '0.0.4'

gem "refile", '~>0.6', require: "refile/rails"
gem "refile-mini_magick"
gem "refile-s3"

group :development, :test do
  gem 'factory_girl'
  gem 'faker'
  gem 'guard'
  gem "guard-minitest"
  gem 'minitest-reporters'
end

group :production do
  gem 'unicorn'
  gem 'rack-timeout'
  gem 'rails_12factor'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
