#!/bin/bash
yum install httpd -y
touch /var/www/html/index.html
echo "hello world from" >> /var/www/html/index.html
${key_name}
chkconfig httpd on