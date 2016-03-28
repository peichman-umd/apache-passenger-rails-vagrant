#!/bin/bash

# add to permanent rules
# 80: default HTTP port
firewall-cmd --zone=public --add-port=80/tcp --permanent

# reload the firewall to make the changes take effect
firewall-cmd --reload
