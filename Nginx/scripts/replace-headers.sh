#!/bin/bash

# Update system's available entropy in X-Vay-Entropy header
ENTROPY=$(cat /proc/sys/kernel/random/entropy_avail)
sed -i "s/header1/$ENTROPY/g" /etc/nginx/nginx.conf

# Update system's load average in X-Vay-Load
LOADAVG=$(cat /proc/loadavg)
sed -i "s:header2:$LOADAVG:g" /etc/nginx/nginx.conf


