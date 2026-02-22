#!/bin/bash
# Lab 20 – Collecting Diagnostic Data and Using Red Hat Insights
# Extracted CLI Commands Only

# ===============================
# Install sos package
# ===============================

sudo dnf install sos -y

# Optional troubleshooting verification
sudo dnf clean all
sudo dnf makecache

# ===============================
# Generate sosreport
# ===============================

sudo sosreport --batch --name=$(hostname)

# Verify sosreport archive
ls -lh /var/tmp/sosreport-*

# ===============================
# Install insights-client
# ===============================

sudo dnf install insights-client -y

# Register system with Red Hat Insights
sudo insights-client --register

# ===============================
# Subscription & Connectivity Verification
# ===============================

sudo subscription-manager status
curl -I https://cloud.redhat.com

# ===============================
# Perform Initial Upload
# ===============================

sudo insights-client

# ===============================
# Configure Daily Automatic Upload
# ===============================

echo "0 0 * * * root /usr/bin/insights-client" | sudo tee /etc/cron.d/insights

# Verify cron configuration
cat /etc/cron.d/insights

# ===============================
# Test Insights Connectivity
# ===============================

sudo insights-client --test-connection
