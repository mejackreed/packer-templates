#!/bin/sh

echo "Finalizing the Geo Concerns app"
cd ~/pregenerated/geo-concerns-demo
mv /tmp/packer-vagrant/Rakefile ./

bundle exec rake solr:clean
bundle exec rake fcrepo:clean
