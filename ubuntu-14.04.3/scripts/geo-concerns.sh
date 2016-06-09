#!/bin/sh

echo "Creating a stock Geo Concerns app"
cd ~/pregenerated

# create a curation-concerns app
rails new geo-concerns-demo --skip-spring
echo pwd
cd geo-concerns-demo
gem install simple_mapnik
echo "gem 'curation_concerns', '1.0.0.beta7'" >> Gemfile
echo "gem 'geo_concerns', '0.0.6'" >> Gemfile
bundle install
yes Y | rails generate curation_concerns:install
yes Y | rails generate geo_concerns:install
rake db:migrate

rm Rakefile

# Make solr core nonpersistent. Causes errors when solr-wrapper is restarted.
sed -i 's/persist: true/persist: false/g' .solr_wrapper

mkdir /tmp/packer-vagrant
chown vagrant /tmp/packer-vagrant
