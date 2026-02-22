#!/bin/bash
# ==========================================
# Lab 06 - Managing Users and Groups
# Commands Executed During Lab
# ==========================================


# ------------------------------
# Lab Setup
# ------------------------------

pwd

sudo -v

sudo dnf install -y shadow-utils


# ------------------------------
# Task 1: User Management
# ------------------------------

# Create user
sudo useradd -m -s /bin/bash labuser1

# Set password
sudo passwd labuser1

# Verify user
id labuser1


# ------------------------------
# Modify User
# ------------------------------

sudo usermod -s /bin/zsh labuser1

sudo usermod -c "Lab User 1" labuser1

grep labuser1 /etc/passwd


# ------------------------------
# Task 2: Group Management
# ------------------------------

# Create group
sudo groupadd labgroup

# Add user to group
sudo usermod -aG labgroup labuser1

# Verify group membership
groups labuser1


# ------------------------------
# Group Administrator
# ------------------------------

sudo gpasswd -A labuser1 labgroup

# Create second user
sudo useradd -m labuser2

sudo passwd labuser2

# Add second user to group
sudo gpasswd -a labuser2 labgroup

# Verify group entry
getent group labgroup


# ------------------------------
# Task 3: Password Policies
# ------------------------------

sudo chage -M 90 -m 7 -W 14 labuser1

sudo chage -l labuser1


# ------------------------------
# Task 4: Cleanup
# ------------------------------

# Remove user (keep home)
sudo userdel labuser1

# Remove user and home directory
sudo userdel -r labuser2

# Verify removal
id labuser1
id labuser2

# Remove group
sudo groupdel labgroup

# Verify users
cut -d: -f1 /etc/passwd | tail

# Verify group removal
getent group labgroup
