#!/bin/bash

NGNIX_SRC=https://github.com/nginx/nginx.git
NGNIX_RELEASE=release-1.21.6
OPEN_SSL=https://github.com/openssl/openssl/archive/refs/tags/OpenSSL_1_1_1o.tar.gz

# Clone Ngnix github repo
echo "clone Ngnix repo with release $NGNIX_RELEASE"
git clone $NGNIX_SRC
cd nginx
git checkout -b $NGNIX_RELEASE $NGNIX_RELEASE
git reset 285a495d

# Create dir for libs
mkdir objs
mkdir objs/lib
cd objs/lib/
wget $OPEN_SSL
tar -xvf OpenSSL_1_1_1o.tar.gz

cd ../../

# Configure ngnix
./auto/configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --with-http_ssl_module  --with-openssl=/nginx/objs/lib/openssl-OpenSSL_1_1_1o --with-pcre --with-file-aio --with-threads --with-http_v2_module --with-select_module --without-poll_module

# Build and install Ngnix 
echo "Build and install ngnix"
make
make install



