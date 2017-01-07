require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rvm'
require 'capistrano/scm/git'
require 'capistrano/rails/console'
require 'capistrano/rails/migrations'
require 'capistrano/rake'
require 'rollbar/capistrano3'
require 'capistrano/sidekiq'
require 'capistrano/sidekiq/monit'

install_plugin Capistrano::SCM::Git

set :rvm_type, :user
set :rvm_ruby_version, '2.3.3'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
