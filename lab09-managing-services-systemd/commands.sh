#!/bin/bash
# ==========================================
# Lab 09 - Managing Services with systemd
# Commands Executed During Lab
# ==========================================


# ------------------------------
# Task 1: Check Service Status
# ------------------------------

systemctl list-units --type=service --state=running

systemctl status sshd


# ------------------------------
# Troubleshooting (if sshd not installed)
# ------------------------------

sudo dnf install openssh-server


# ------------------------------
# Task 2: Start, Stop, Restart Services
# ------------------------------

sudo systemctl stop sshd
systemctl status sshd

sudo systemctl start sshd
systemctl status sshd

sudo systemctl restart sshd


# ------------------------------
# Task 3: Enable and Disable Services at Boot
# ------------------------------

sudo systemctl enable sshd

sudo systemctl disable sshd


# ------------------------------
# Task 4: Inspect Unit Files
# ------------------------------

systemctl cat sshd

systemctl list-dependencies sshd


# ------------------------------
# Task 5: View Logs with journalctl
# ------------------------------

sudo journalctl -u sshd | tail

sudo journalctl -u sshd --since "1 hour ago"

sudo journalctl -u sshd -f


# ------------------------------
# Additional Practice
# ------------------------------

systemd-analyze blame

sudo systemctl mask sshd
