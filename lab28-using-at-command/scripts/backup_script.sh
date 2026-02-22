#!/bin/bash

# Lab 28 – One-Time Backup Script Using at Command
# This script creates a compressed backup of the Documents directory
# and logs execution timestamps.

# Ensure backup directory exists
mkdir -p ~/backups

# Log start time
echo "Backup started at $(date)" >> ~/backups/backup_log.txt

# Create compressed archive of Documents directory
tar -czf ~/backups/home_backup_$(date +%Y%m%d).tar.gz ~/Documents

# Log completion time
echo "Backup completed at $(date)" >> ~/backups/backup_log.txt
