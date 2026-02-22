#!/bin/bash
# ==========================================
# Lab 11 - Analyzing and Storing Logs
# Commands Executed During Lab
# ==========================================


# ------------------------------
# Task 1: Exploring /var/log
# ------------------------------

ls -l /var/log

sudo cat /var/log/messages | tail

sudo cat /var/log/secure | tail


# ------------------------------
# Task 2: Using journalctl
# ------------------------------

sudo journalctl | head

sudo journalctl --since "1 hour ago"

sudo journalctl -u sshd | tail

sudo journalctl -f


# ------------------------------
# Task 3: Understanding logrotate
# ------------------------------

ls /etc/logrotate.d/

cat /etc/logrotate.conf

sudo nano /etc/logrotate.d/mylogs

sudo logrotate -d /etc/logrotate.d/mylogs


# ------------------------------
# Task 4: Searching Logs with grep and awk
# ------------------------------

sudo grep "error" /var/log/messages

sudo grep -i "fail" /var/log/secure

sudo grep -c "Failed password" /var/log/secure

sudo awk '/Failed password/ {print $1, $2, $3, $11}' /var/log/secure


# ------------------------------
# Container Log Inspection (Podman)
# ------------------------------

podman ps

podman logs a1b2c3d4e5f6 | grep -i error


# ------------------------------
# Verification
# ------------------------------

sudo journalctl --disk-usage


# ------------------------------
# Cleanup
# ------------------------------

sudo rm -f /etc/logrotate.d/mylogs
