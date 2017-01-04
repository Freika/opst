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

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  # debug
  gem 'rack-mini-profiler', require: false
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet'
  gem 'flamegraph'
  gem 'stackprof', '~> 0.2.7'

  # server
  gem 'puma'

  # deployment
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rvm', github: 'capistrano/rvm'
  gem 'capistrano-rake', require: false

  gem 'rails_real_favicon'
end

group :production do
  gem 'rollbar'
end
