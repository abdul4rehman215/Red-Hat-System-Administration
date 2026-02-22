#!/usr/bin/env bash
# Lab 18: Securing the System with SELinux Basics
# Commands executed

# --- Setup Verification ---

# Verify SELinux status
sestatus

# Install SELinux troubleshooting tools
sudo dnf install setroubleshoot setools-console policycoreutils-python-utils -y


# --- Task 1: Viewing SELinux Contexts ---

# Create test file
touch /tmp/testfile.txt

# View file context
ls -Z /tmp/testfile.txt

# View directory context
ls -Zd /tmp


# --- Task 2: Changing Contexts with chcon ---

# Create web directory
sudo mkdir /web

# Check default context
ls -Zd /web

# Change context temporarily
sudo chcon -t httpd_sys_content_t /web

# Verify context change
ls -Zd /web

# Restore default context
sudo restorecon -v /web

# Verify restoration
ls -Zd /web


# --- Task 3: Generate AVC Denial ---

# Install httpd
sudo dnf install httpd -y

# Start httpd service
sudo systemctl start httpd

# Create test content
sudo mkdir -p /web/html
sudo touch /web/html/index.html

# Intentionally assign wrong context
sudo chcon -t user_home_t /web/html/index.html

# Attempt access (should fail)
curl http://localhost/html/index.html


# --- Analyze Denial ---

# Search for recent AVC denials
sudo ausearch -m avc -ts recent

# Analyze with sealert
sudo sealert -a /var/log/audit/audit.log


# --- Resolve Denial ---

# Correct context
sudo chcon -t httpd_sys_content_t /web/html/index.html

# Verify context
ls -Z /web/html/index.html

# Test access again
curl http://localhost/html/index.html


# --- Persistent Context Fix ---

sudo semanage fcontext -a -t httpd_sys_content_t "/web(/.*)?"
sudo restorecon -Rv /web


# --- Troubleshooting Mode Toggle ---

sudo setenforce 0
getenforce

sudo setenforce 1
getenforce


# --- Final Verification ---

sestatus
