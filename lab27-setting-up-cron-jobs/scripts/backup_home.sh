#!/bin/bash

# Backup Script for Home Directory
# Lab 27 – Cron Job Automation

# Create compressed backup of home directory
tar -czf ~/backups/home_backup_$(date +%Y%m%d).tar.gz ~/

# Log backup completion with timestamp
echo "Backup completed on $(date)" >> ~/backups/backup_log.txt
