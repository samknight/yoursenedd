ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require 'factory_girl'

Minitest::Reporters.use!

Dir.glob(File.dirname(__FILE__) + "/factories/*").each do |factory|
  require factory
end

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  ActiveRecord::Migration.check_pending!
end
