#!/bin/bash

# Identify disks
lsblk

# Create physical volumes
sudo pvcreate /dev/sdb /dev/sdc
sudo pvs

# Create volume group
sudo vgcreate my_vg /dev/sdb /dev/sdc
sudo vgs

# Create logical volume (5GB)
sudo lvcreate -L 5G -n my_lv my_vg
sudo lvs

# Format and mount
sudo mkfs.ext4 /dev/my_vg/my_lv
sudo mkdir /mnt/mylv
sudo mount /dev/my_vg/my_lv /mnt/mylv
df -h /mnt/mylv

# Extend logical volume by 2GB
sudo lvextend -L +2G /dev/my_vg/my_lv
sudo resize2fs /dev/my_vg/my_lv
df -h /mnt/mylv

# Create snapshot (1GB)
sudo lvcreate -L 1G -s -n my_snapshot /dev/my_vg/my_lv
sudo lvs

# Merge snapshot
sudo umount /mnt/mylv
sudo lvconvert --merge /dev/my_vg/my_snapshot
sudo mount /dev/my_vg/my_lv /mnt/mylv

# Cleanup (optional)
sudo umount /mnt/mylv
sudo lvremove /dev/my_vg/my_lv
sudo vgremove my_vg
sudo pvremove /dev/sdb /dev/sdc
