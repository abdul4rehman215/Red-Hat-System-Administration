#!/bin/bash
# Lab 27 – Setting Up Cron Jobs
# Commands Executed During Lab

# Task 1: Create backup directory
mkdir ~/backups

# Verify directory
ls

# Create backup script
nano ~/backups/backup_home.sh

# Make script executable
chmod +x ~/backups/backup_home.sh

# Verify permissions
ls -l ~/backups/

# Edit crontab
crontab -e

# Verify cron job
crontab -l


# Task 2: Add multiple cron expressions

crontab -e

# Verify all jobs
crontab -l

# Verify cron test log (after waiting 1–2 minutes)
cat ~/cron_test.log

# Verify time log
cat ~/time_log.txt


# Task 3: Manage cron jobs

# List current jobs
crontab -l

# Remove all jobs
crontab -r

# Verify removal
crontab -l


# Cleanup
rm -rf ~/backups
rm -f ~/cron_test.log ~/weekly_log.txt ~/time_log.txt
