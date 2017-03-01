source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap-sass'
gem 'select2-rails'
gem 'jquery-turbolinks'
gem 'rails-assets-highcharts', source: 'https://rails-assets.org'
gem 'slim-rails'
gem 'figaro'
gem 'capistrano-rails-console', require: false

gem 'devise'
gem 'will_paginate'
gem 'sidekiq'
gem 'rbnacl'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :test do
  gem 'capybara', '~> 2.8'
  gem 'capybara-webkit'
  gem 'database_cleaner', '~> 1.3'
  gem 'shoulda-matchers', '~> 2.8'
  gem 'codeclimate-test-reporter', require: nil
end

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'spring'
  gem 'launchy'
end

group :development do
  # debug
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet'

  # server
  gem 'puma'

  # deployment
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rvm', github: 'capistrano/rvm'
  gem 'capistrano-rake', require: false
  gem 'capistrano-sidekiq'

  gem 'rails_real_favicon'
end

group :production do
  gem 'rollbar'


  # Profilers
  gem 'rack-mini-profiler', require: false
  # For memory profiling (requires Ruby MRI 2.1+)
  gem 'memory_profiler'

  # For call-stack profiling flamegraphs (requires Ruby MRI 2.0.0+)
  gem 'flamegraph'
  gem 'stackprof'     # For Ruby MRI 2.1+
  gem 'fast_stack'    # For Ruby MRI 2.0
end
