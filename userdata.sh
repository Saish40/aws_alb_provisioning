#!/bin/bash
apt-get update -y
apt-get install apache2 -y
echo “Hello World from $(hostname -f)” > /var/www/html/index.html
systemctl start apache2