#!/bin/bash

sudo cp /vagrant/files/railsapp.conf /etc/httpd/conf.d/
sudo systemctl restart httpd

cd /apps/src
bundle install
