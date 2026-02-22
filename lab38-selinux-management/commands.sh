#!/bin/bash

# Check SELinux status
sestatus
getenforce

# Switch to permissive
sudo setenforce 0
getenforce

# Switch back to enforcing
sudo setenforce 1
getenforce

# Install semanage tools
sudo yum install policycoreutils-python -y

# List HTTP ports
sudo semanage port -l | grep http

# Add custom port 8081
sudo semanage port -a -t http_port_t -p tcp 8081
sudo semanage port -l | grep 8081

# Remove custom port
sudo semanage port -d -t http_port_t -p tcp 8081

# Search for AVC denials
sudo ausearch -m avc -ts recent

# Generate policy module
sudo grep "avc: denied" /var/log/audit/audit.log | audit2allow -M mypolicy

# Apply module
sudo semodule -i mypolicy.pp

# Verify module
sudo semodule -l | grep mypolicy

# Remove module (cleanup)
sudo semodule -r mypolicy
