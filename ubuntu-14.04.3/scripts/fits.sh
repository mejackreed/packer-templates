#!/bin/sh

# FITS
SHARED_DIR="/vagrant"
FITS_VERSION=0.10.0

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

sudo apt-get -y install libmediainfo-dev

DOWNLOAD_URL="http://projects.iq.harvard.edu/files/fits/files/fits-${FITS_VERSION}.zip"
sudo curl $DOWNLOAD_URL > fits.zip
unzip fits.zip
chmod a+x fits-$FITS_VERSION/*.sh
cd fits-$FITS_VERSION/
sudo mv *.properties *.sh lib tools xml /usr/local/bin
