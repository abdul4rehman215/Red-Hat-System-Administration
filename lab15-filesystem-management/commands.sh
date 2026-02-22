#!/bin/bash

# ==========================================
# Lab 15: Accessing and Managing Filesystems
# ==========================================

echo "===== TASK 1: Inspect Block Devices ====="

# List block devices
lsblk

# Show filesystem details
lsblk -f

# Show partition tables
sudo fdisk -l

# Show UUID information
sudo blkid


echo "===== TASK 2: Create Partition ====="

# Create partition on secondary disk
# (Interactive — example commands below)
echo "Run: sudo fdisk /dev/nvme1n1"
echo "Inside fdisk:"
echo "  n  (new partition)"
echo "  p  (primary)"
echo "  1  (partition number)"
echo "  <Enter> <Enter>"
echo "  w  (write changes)"


echo "===== TASK 3: Format Filesystem ====="

# Format new partition
sudo mkfs.ext4 /dev/nvme1n1p1


echo "===== TASK 4: Temporary Mount ====="

# Create mount point
sudo mkdir -p /mnt/mydisk

# Mount partition
sudo mount /dev/nvme1n1p1 /mnt/mydisk

# Verify mount
df -h | grep mydisk

# Unmount
sudo umount /mnt/mydisk


echo "===== TASK 5: Persistent Mount (fstab) ====="

# Backup fstab
sudo cp /etc/fstab /etc/fstab.bak

# Get UUID
sudo blkid /dev/nvme1n1p1

echo "Add entry to /etc/fstab:"
echo "UUID=<uuid> /mnt/mydisk ext4 defaults 0 2"

# Test configuration
sudo mount -a

df -h | grep mydisk


echo "===== TASK 6: LVM Creation ====="

# Initialize physical volume
sudo pvcreate /dev/nvme1n1

# Create volume group
sudo vgcreate myvg /dev/nvme1n1

# Create logical volume (5G)
sudo lvcreate -L 5G -n mylv myvg

# Format logical volume
sudo mkfs.ext4 /dev/myvg/mylv

# Mount LVM
sudo mkdir -p /mnt/lvm
sudo mount /dev/myvg/mylv /mnt/lvm

df -h | grep lvm


echo "===== TASK 7: Extend LVM ====="

# Extend logical volume by 2G
sudo lvextend -L +2G /dev/myvg/mylv

# Resize filesystem
sudo resize2fs /dev/myvg/mylv

# Verify new size
df -h | grep lvm


echo "===== TASK 8: Verification ====="

# Display volume information
sudo pvdisplay
sudo vgdisplay
sudo lvdisplay

echo "===== Lab 15 Completed ====="
