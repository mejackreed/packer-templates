#!/bin/bash -eux

# From https://gorails.com/setup/ubuntu/14.04

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

gem install rails -v 4.2.5

rbenv rehash

rails -v
