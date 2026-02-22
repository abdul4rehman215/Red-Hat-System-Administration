#!/bin/bash

# ==========================================
# Lab 16: NFS and CIFS Network Filesystems
# ==========================================

echo "===== TASK 1: Install Required Packages ====="

# Update system
sudo dnf update -y

# Install NFS and CIFS utilities
sudo dnf install -y nfs-utils cifs-utils

# Verify installation
rpm -q nfs-utils cifs-utils


echo "===== TASK 2: Mount NFS Share ====="

# Discover NFS exports
showmount -e 10.0.2.20

# Create mount point
sudo mkdir -p /mnt/nfs_share

# Mount NFS share
sudo mount -t nfs 10.0.2.20:/share /mnt/nfs_share

# Verify mount
df -hT | grep nfs
ls /mnt/nfs_share


echo "===== TASK 3: Mount CIFS Share ====="

# Create credentials file
echo "username=student" | sudo tee /etc/cifs_credentials > /dev/null
echo "password=nafi123" | sudo tee -a /etc/cifs_credentials > /dev/null

# Secure credentials
sudo chmod 600 /etc/cifs_credentials

# Verify permissions
ls -l /etc/cifs_credentials

# Create mount point
sudo mkdir -p /mnt/cifs_share

# Mount CIFS share
sudo mount -t cifs -o credentials=/etc/cifs_credentials \
//10.0.2.30/shared /mnt/cifs_share

# Verify mount
df -hT | grep cifs
ls /mnt/cifs_share


echo "===== TASK 4: Configure Persistent Mounts ====="

# Backup fstab
sudo cp /etc/fstab /etc/fstab.bak

# Add NFS entry
echo "10.0.2.20:/share /mnt/nfs_share nfs defaults,_netdev 0 0" | \
sudo tee -a /etc/fstab

# Add CIFS entry
echo "//10.0.2.30/shared /mnt/cifs_share cifs credentials=/etc/cifs_credentials,uid=1000,gid=1000,_netdev 0 0" | \
sudo tee -a /etc/fstab

# Test configuration
sudo mount -a

# Verify persistent mounts
df -hT | grep -E 'nfs|cifs'
mount | grep -E 'nfs|cifs'


echo "===== Lab 16 Completed ====="
