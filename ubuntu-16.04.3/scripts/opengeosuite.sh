#!/bin/bash -x

wget -qO- https://apt.boundlessgeo.com/gpg.key | apt-key add -
echo "deb https://apt.boundlessgeo.com/suite/v46/ubuntu/ trusty main" > /etc/apt/sources.list.d/opengeo.list

apt-get update
apt-cache search opengeo
apt-get -y install opengeo-server
