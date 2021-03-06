require 'simplecov'
SimpleCov.start 'rails'

require 'coveralls'
Coveralls.wear!

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
include Capybara::DSL
require 'rspec/autorun'

include Warden::Test::Helpers
Warden.test_mode!
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.use_transactional_examples = false
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include Devise::TestHelpers, :type => :controller
  config.include Devise::TestHelpers, :type => :view
  config.include RequestMacros, :type => :request

  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:twitter, {
    :uid => '12345',
    :nickname => 'fooman',
    :user_info => {
      :first_name => 'Foo',
      :last_name => 'Man'
    }
  })
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end
