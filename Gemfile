source 'https://rubygems.org'

gem 'rails', '4.1.5'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'bootstrap-sass', '~> 3.2.0'
gem 'high_voltage'
gem 'omniauth'
gem 'omniauth-github'
gem 'pundit'
gem 'simple_form'
gem 'slim-rails'
gem 'dotenv-rails'
gem 'autoprefixer-rails'

gem 'sinatra', '>= 1.3.0', :require => nil
gem 'sidekiq'
gem 'sidekiq-failures'

gem 'treetop'

gem 'neography'
gem 'redis'

gem 'faker'
gem 'newrelic_rpm'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]# 
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano-sidekiq' , github: 'seuros/capistrano-sidekiq'
  gem 'foreman'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'growl'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'thin'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem "codeclimate-test-reporter", group: :test, require: nil
end
