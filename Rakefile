# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

Brackets::Application.load_tasks

MONGOD_LOCATION = '~/Downloads/mongodb-osx-i386-1.6.2/bin/mongod'
MONGO_DATA_LOCATION = '~/Downloads/mongodb-osx-i386-1.6.2/bin/db'
namespace :mongo do
  task :start do
    sh "#{MONGOD_LOCATION} --dbpath #{MONGO_DATA_LOCATION}"
  end
end
