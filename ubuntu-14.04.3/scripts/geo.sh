#!/bin/sh

echo "Installing geo packages"

sudo add-apt-repository -y ppa:ubuntugis/ppa
sudo apt-get update

sudo apt-get -y install gdal-bin zip
sudo apt-get -y install libmapnik=2.3* mapnik-utils=2.3* libmapnik-dev=2.3* 
sudo apt-get -y install mapnik-input-plugin-gdal mapnik-input-plugin-ogr mapnik-input-plugin-osm

# Copy input plugins to expected location
sudo cp -R /usr/lib/mapnik/ /usr/local/lib/.
