#!/bin/sh

echo "Creating a stock Geo Concerns app"

# create a curation-concerns app
rails new geo-concerns-demo --skip-spring
cd geo-concerns-demo
gem install simple_mapnik
echo "gem 'curation_concerns', '1.0.0.beta7'" >> Gemfile
echo "gem 'geo_concerns', '0.0.6'" >> Gemfile
bundle install
yes Y | rails generate curation_concerns:install
yes Y | rails generate geo_concerns:install
rake db:migrate

# start redis
/etc/init.d/redis-server start

rm Rakefile
cat > Rakefile <<- EOM
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'solr_wrapper/rake_task'
require 'fcrepo_wrapper/rake_task'

namespace :demo do
  desc "Run fedora, solr, and rails servers for Geo Concerns"
  task :servers do
    with_server 'development' do
      begin
        `rails s -b 0.0.0.0`
      rescue Interrupt
        puts "Shutting down..."
      end
    end
  end
  desc "Setup fedora and solr for Geo Concerns"
  task :setup do
    with_server 'development' do
    end
  end
end

EOM

# Make solr core nonpersistent. Causes errors when solr-wrapper is restarted.
sed -i 's/persist: true/persist: false/g' .solr_wrapper

# setup fedora and solr
rake demo:server
