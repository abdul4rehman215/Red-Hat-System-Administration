#!/bin/bash
# ==========================================
# Lab 10 - Configuring and Securing SSH
# Commands Executed During Lab
# ==========================================


# ------------------------------
# Task 1: Install and Verify OpenSSH
# ------------------------------

ssh -V

sudo dnf install openssh-server -y

sudo systemctl status sshd

sudo systemctl start sshd


# ------------------------------
# Task 2: Secure SSH Configuration
# ------------------------------

# Backup configuration
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Edit configuration file
sudo nano /etc/ssh/sshd_config

# Restart SSH service after modification
sudo systemctl restart sshd

# Verify new listening port
ss -tulnp | grep ssh


# ------------------------------
# Task 3: Key-Based Authentication
# (Client-Side Commands)
# ------------------------------

ssh-keygen -t ed25519 -C "student@example.com"

ssh-copy-id -p 2222 student@10.0.2.15

ssh -p 2222 student@10.0.2.15


# Fix permissions if login fails
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys


# ------------------------------
# Task 4: Configure Firewall
# ------------------------------

sudo firewall-cmd --permanent --add-port=2222/tcp

sudo firewall-cmd --reload

sudo firewall-cmd --list-ports


# ------------------------------
# Final Verification
# ------------------------------

ssh -p 2222 student@10.0.2.15
