#!/bin/bash
apt install apache2 -y
echo "Hello from Terraform!! Subnet for Firewall: ${firewall_subnets}" > /var/www/html/index.html
service apache2 start
chkconfig apache2 on
