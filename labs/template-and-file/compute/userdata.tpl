#!/bin/bash
yum install httpd -y
echo "Message from the server: ${message}" >> /var/www/html/index.html
service httpd start
chkconfig httpd on