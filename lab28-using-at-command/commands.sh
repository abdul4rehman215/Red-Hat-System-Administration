#!/bin/bash
# Lab 28 – Using at Command for Scheduling
# Commands Executed During Lab

# Step 1: Enable and start atd service
sudo systemctl enable --now atd

# Verify service status
systemctl status atd

# Verify at installation
at -V


# Task 1: Create backup directory
mkdir ~/backups

# Verify directory
ls

# Create backup script
nano ~/backup_script.sh

# Make script executable
chmod +x ~/backup_script.sh

# Verify permissions
ls -l ~/backup_script.sh


# Schedule backup in 5 minutes
at now + 5 minutes -f ~/backup_script.sh

# Verify scheduled job
atq


# Alternative time formats

at 11:30 PM tomorrow
# (echo command entered, Ctrl+D to exit)

at 9:00 AM next week
# (date command entered, Ctrl+D to exit)

at now + 1 hour
# (echo command entered, Ctrl+D to exit)


# List all scheduled jobs
atq

# Remove specific job
atrm 4

# Verify removal
atq


# View job spool files
sudo ls /var/spool/at

# View job content
sudo cat /var/spool/at/a00001019c2b34


# Troubleshooting checks
systemctl status atd
journalctl -u atd
timedatectl


# Cleanup: Remove all test jobs
atq | awk '{print $1}' | xargs atrm

# Verify no jobs remain
atq
