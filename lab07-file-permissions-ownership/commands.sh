#!/bin/bash
# ==========================================
# Lab 07 - Controlling File Permissions and Ownership
# Commands Executed During Lab
# ==========================================


# ------------------------------
# Lab Setup
# ------------------------------

pwd

mkdir ~/permissions_lab
cd ~/permissions_lab
pwd


# ------------------------------
# Task 1: Viewing File Permissions
# ------------------------------

touch file1.txt
mkdir dir1

ls -l
ls -la


# ------------------------------
# Task 2: Modifying Permissions (Symbolic Mode)
# ------------------------------

chmod u+x file1.txt
ls -l file1.txt

chmod g-r file1.txt
ls -l file1.txt

chmod u=rwx,g=rx,o= file1.txt
ls -l file1.txt


# ------------------------------
# Task 2: Modifying Permissions (Numeric Mode)
# ------------------------------

chmod 755 file1.txt
ls -l file1.txt

chmod 600 file1.txt
ls -l file1.txt


# ------------------------------
# Task 3: Managing Ownership
# ------------------------------

sudo chown root file1.txt
ls -l file1.txt

sudo chown student:student file1.txt
ls -l file1.txt

sudo chgrp wheel file1.txt
ls -l file1.txt


# ------------------------------
# Task 4: Special Permission Bits
# ------------------------------

# SUID demonstration
which passwd
ls -l /usr/bin/passwd
sudo chmod u+s /usr/bin/passwd

# SGID demonstration
mkdir shared_dir
sudo chmod g+s shared_dir
ls -ld shared_dir

# Sticky Bit demonstration
sudo chmod +t /tmp
ls -ld /tmp


# ------------------------------
# Task 5: SELinux Contexts
# ------------------------------

sudo dnf install policycoreutils-python-utils -y

ls -Z file1.txt

sudo chcon -t httpd_sys_content_t file1.txt
ls -Z file1.txt

sudo restorecon -v file1.txt
ls -Z file1.txt


# ------------------------------
# Cleanup
# ------------------------------

cd ~
rm -rf ~/permissions_lab
