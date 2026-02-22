#!/bin/bash

# ========================
# SERVER SIDE
# ========================

# Install NFS utilities
sudo yum install nfs-utils -y

# Enable NFS service
sudo systemctl enable --now nfs-server

# Configure firewall
sudo firewall-cmd --add-service={nfs,nfs3,mountd,rpc-bind} --permanent
sudo firewall-cmd --reload

# Create shared directory
sudo mkdir -p /mnt/nfs_share
sudo chown nobody:nobody /mnt/nfs_share
sudo chmod 777 /mnt/nfs_share

# Configure exports
echo "/mnt/nfs_share 192.168.1.101(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports

# Apply export
sudo exportfs -arv
sudo exportfs -v

# ========================
# CLIENT SIDE
# ========================

# Install NFS utilities
sudo yum install nfs-utils -y

# Create mount point
sudo mkdir -p /mnt/nfs_mount

# Mount NFS share
sudo mount -t nfs 192.168.1.100:/mnt/nfs_share /mnt/nfs_mount

# Verify mount
df -hT | grep nfs

# Test file sharing
echo "NFS test file" | sudo tee /mnt/nfs_mount/testfile.txt

# ========================
# PERSISTENT MOUNT
# ========================

echo "192.168.1.100:/mnt/nfs_share /mnt/nfs_mount nfs defaults 0 0" | sudo tee -a /etc/fstab

sudo umount /mnt/nfs_mount
sudo mount -a
df -hT | grep nfs
