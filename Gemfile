source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'sassc-rails', '~> 1.3.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap-sass'
gem 'select2-rails'
gem 'jquery-turbolinks'
gem 'rails-assets-highcharts', source: 'https://rails-assets.org'
gem 'rails-assets-DataTables', source: 'https://rails-assets.org'
gem 'slim-rails'
gem 'figaro'
gem 'capistrano-rails-console', require: false
gem 'mini_racer'

gem 'devise'
gem 'will_paginate'
gem 'sidekiq'

# Encrypting
gem 'rbnacl'
gem 'bcrypt_pbkdf'
gem 'rbnacl-libsodium'

# ML
gem 'decisiontree'
gem 'descriptive_statistics', '~> 2.4.0', require: 'descriptive_statistics/safe'


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
  gem 'irbtools-more', require: 'irbtools/binding'

  # CI
  gem 'pronto'
  gem 'pronto-rubocop', require: false
  gem 'pronto-fasterer', require: false
  gem 'pronto-rails_best_practices', require: false
  gem 'pronto-rails_schema', require: false
  gem 'pronto-slim', require: false
  gem 'pronto-flay', require: false

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

  gem 'switch_user'
end

group :production do
  gem 'rollbar'
  gem 'newrelic_rpm'

  # Profilers
  gem 'rack-mini-profiler', require: false
  # For memory profiling (requires Ruby MRI 2.1+)
  gem 'memory_profiler'

  # For call-stack profiling flamegraphs (requires Ruby MRI 2.0.0+)
  gem 'flamegraph'
  gem 'stackprof'     # For Ruby MRI 2.1+
  gem 'fast_stack'    # For Ruby MRI 2.0
end
