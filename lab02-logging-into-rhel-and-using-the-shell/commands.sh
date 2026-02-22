#!/bin/bash
# ==========================================
# Lab 02 - Logging into RHEL and Using the Shell
# Commands Executed During Lab
# ==========================================

# ------------------------------
# Task 1: Local Login (Console)
# ------------------------------
# (Console login is interactive; no command executed prior to prompt)
# Username entered at login prompt:
# student
# Password entered (hidden)

# ------------------------------
# Task 2: Remote SSH Login
# ------------------------------

# Check SSH service status on RHEL
sudo systemctl status sshd

# Check IP address on RHEL
ip a

# From remote client system:
ssh student@10.0.2.15

# If troubleshooting connectivity:
ping -c 3 10.0.2.15

# Check firewall configuration on RHEL
sudo firewall-cmd --list-all


# ------------------------------
# Task 3: Basic Shell Commands
# ------------------------------

pwd

ls

ls -lh

ls -a

man ls

exit


# ------------------------------
# Task 4: Customize Shell Prompt (PS1)
# ------------------------------

# View current PS1
echo $PS1

# Temporarily change PS1
PS1="[\u@\h \W \t]\$ "

pwd

# Edit bashrc for permanent change
nano ~/.bashrc

# After adding:
# export PS1="[\u@\h \W \t]\$ "

source ~/.bashrc

echo "Prompt updated and persistent."
