# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

Brackets::Application.load_tasks

if ENV['COMPUTERNAME'] == 'WALLACE'
  MONGOD_LOCATION = 'C:\Users\bjball\Documents\Libraries\mongodb-win32-x86_64-1.6.2\bin\mongod.exe'
  MONGO_DATA_LOCATION = 'C:\Users\bjball\Documents\Libraries\mongodb-win32-x86_64-1.6.2\bin\test'  
elsif ENV['COMPUTERNAME'] == 'COLOSSUS'
  MONGOD_LOCATION = 'C:\mongo\bin\mongod'
  MONGO_DATA_LOCATION = 'C:\mongo\bracketdata'
else
  MONGOD_LOCATION = '~/Downloads/mongodb-osx-i386-1.6.2/bin/mongod'
  MONGO_DATA_LOCATION = '~/Downloads/mongodb-osx-i386-1.6.2/bin/db'
end
namespace :mongo do
  task :start do
    sh "#{MONGOD_LOCATION} --dbpath #{MONGO_DATA_LOCATION}"
  end
end
