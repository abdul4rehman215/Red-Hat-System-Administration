#!/bin/bash
# Lab 19 – Using Red Hat Customer Portal and Cockpit

# ===============================
# Prerequisites Verification
# ===============================

cat /etc/os-release | head
hostname
ip -br a

# ===============================
# Install Cockpit
# ===============================

sudo dnf install cockpit cockpit-podman -y

# Enable and start Cockpit socket
sudo systemctl enable --now cockpit.socket

# Verify Cockpit socket status
sudo systemctl status cockpit.socket

# ===============================
# Firewall Configuration
# ===============================

sudo firewall-cmd --add-service=cockpit --permanent
sudo firewall-cmd --reload

# Verify port 9090 is listening
sudo ss -tulnp | grep 9090

# ===============================
# Cockpit Log Verification
# ===============================

sudo journalctl -u cockpit --no-pager | tail -n 10

# ===============================
# Final Verification
# ===============================

sudo systemctl is-enabled cockpit.socket
sudo systemctl is-active cockpit.socket

curl -kI https://localhost:9090 | head
