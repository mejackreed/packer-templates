#!/bin/sh

echo "Creating a stock Geo Concerns app"

# create a curation-concerns app
rails new geo-concerns-demo --skip-spring
cd geo-concerns-demo
sudo gem install simple_mapnik
echo "gem 'curation_concerns', '1.0.0.beta7'" >> Gemfile
echo "gem 'geo_concerns', '0.0.6'" >> Gemfile
bundle install
yes Y | rails generate curation_concerns:install
yes Y | rails generate geo_concerns:install
rake db:migrate

# start redis
sudo /etc/init.d/redis-server start

SHARED_DIR="/vagrant"

# Copy in new Rakefile
yes | cp -rf $SHARED_DIR/install_scripts/Rakefile .

# Make solr core nonpersistent. Causes errors when solr-wrapper is restarted.
sed -i 's/persist: true/persist: false/g' .solr_wrapper

# setup fedora and solr
rake demo:setup
