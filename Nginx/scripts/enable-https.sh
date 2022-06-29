#!/bin/bash

echo "Enable https on Nginx"
cd /etc/nginx/
echo -e "\n\n\n\n\n\n\n" | openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out cert.pem -keyout cert.key

