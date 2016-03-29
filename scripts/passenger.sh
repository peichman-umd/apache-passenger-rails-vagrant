#!/bin/bash

# https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/apache/oss/el7/install_passenger.html

yum install -y httpd epel-release pygpgme curl
curl --fail -sSLo /etc/yum.repos.d/passenger.repo \
  https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo
yum install -y mod_passenger
systemctl restart httpd

# ensure Apache starts at boot
systemctl enable httpd.service
