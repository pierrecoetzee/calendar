source 'https://rubygems.org'

gem 'rails', '3.2.18'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

 gem 'pg'

# Gems used only for assets and not required
# in production environments by default.

gem "haml-rails"
# gem 'bootstrap-sass', '2.1'
gem 'bootstrap-sass', '~> 2.3'
gem 'bootstrap-x-editable-rails', '= 1.5.0'
gem "jquery-ui-rails", "~> 4.0.0"
gem "underscore-rails"

gem 'coffee-script'

gem 'colorize'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass', '3.2.13'
  gem 'turbo-sprockets-rails3'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'animate-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'yui-compressor'
end

group :development, :test do
  # gem 'thin'
  gem "rspec-rails", "~> 2.0"
  gem "capybara", '= 2.2.1'
  gem 'database_cleaner'
  gem 'headless'
end

group :test do
  gem 'poltergeist'#, github: 'simon-engledew/poltergeist'
  gem 'selenium-webdriver'
  gem 'ci_reporter'
  gem 'simplecov'
  gem 'simplecov-rcov'
  gem 'factory_girl_rails'
  gem 'rspec-instafail'
  gem 'faker'
end

gem 'jquery-rails'

group :production do
 gem 'rails_12factor'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
