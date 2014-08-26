# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/dsl'
require 'capybara/poltergeist'

# require Rails.root.join('db', 'seeds.rb')

Capybara.default_driver = (ENV['WEB_DRIVER'] || :poltergeist).to_sym

Capybara.default_wait_time = 10

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, { debug: false, 
                                           window_size: [1300, 1000] 
})
end

RSpec.configure do |config|

  config.color = true
  # Use color not only in STDOUT but also in pagers and files
  config.tty = true
  
  config.infer_spec_type_from_file_location!

  config.fixture_path = Rails.root.join('spec', 'fixtures').to_s

end

Capybara.default_wait_time = 5

require 'timeout'

module WaitSteps
  extend RSpec::Matchers::DSL

  matcher :become_true do |timeout = Capybara.default_wait_time|
    match do |block|
      begin
        Timeout.timeout(timeout) do
          until value = block.call
            sleep(0.1)
          end
          value
        end
      rescue TimeoutError
        false
      end
    end
  end
end

module LoginSteps

  def login_as_admin_for(user)

  	visit login_page_path
  	fill_in 'user_email', with: user.email
  	fill_in 'user_password', with: user.password
  	find(:xpath, './/input[@type="submit"]').click
  	
  end

end