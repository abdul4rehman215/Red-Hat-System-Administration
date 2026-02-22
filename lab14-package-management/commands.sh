#!/bin/bash

# ==============================
# Lab 14: Package Management
# ==============================

echo "===== TASK 1: Subscription Management ====="

# Check subscription status
sudo subscription-manager status

# Register system (if not registered)
# sudo subscription-manager register --username=<username> --password=<password> --autoattach


echo "===== TASK 2: Repository Management ====="

# List all repositories
sudo dnf repolist all

# Enable CodeReady Builder repository
sudo dnf config-manager --enable codeready-builder-for-rhel-9-rpms

# Verify enabled repos
sudo dnf repolist

# Disable repository
sudo dnf config-manager --disable codeready-builder-for-rhel-9-rpms


echo "===== TASK 3: Package Installation ====="

# Install Apache HTTP Server
sudo dnf install -y httpd

# Verify installation
rpm -q httpd

# Remove Apache
sudo dnf remove -y httpd

# Update system packages
sudo dnf update -y


echo "===== TASK 4: Package Groups ====="

# List available groups
sudo dnf group list

# Install Development Tools group
sudo dnf group install -y "Development Tools"


echo "===== TASK 5: Modules ====="

# List available modules
sudo dnf module list

# Enable Node.js 18 module
sudo dnf module enable -y nodejs:18

# Install Node.js
sudo dnf install -y nodejs

# Verify Node installation
node -v


echo "===== TASK 6: Additional Verification ====="

# View DNF transaction history
sudo dnf history

# List installed node packages
rpm -qa | grep node

echo "===== Lab 14 Completed ====="
