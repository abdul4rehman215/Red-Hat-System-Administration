#!/bin/bash
# ==========================================
# Lab 12 - Configuring Network Interfaces
# Commands Executed During Lab
# ==========================================


# ------------------------------
# Lab Setup
# ------------------------------

sudo systemctl status NetworkManager


# ------------------------------
# Task 1: Listing Network Devices
# ------------------------------

nmcli device status

nmcli device show eth0


# ------------------------------
# Task 2: Configure Static IP
# ------------------------------

nmcli connection show

sudo nmcli connection modify "System eth0" \
ipv4.addresses 192.168.1.100/24 \
ipv4.gateway 192.168.1.1 \
ipv4.dns "8.8.8.8,8.8.4.4" \
ipv4.method manual

sudo nmcli connection up "System eth0"


# ------------------------------
# Task 3: Modify Connection Profile
# ------------------------------

nmcli connection show "System eth0" | grep ipv4

sudo nmcli connection modify "System eth0" 802-3-ethernet.mtu 1500

sudo nmcli connection modify "System eth0" ipv6.method disabled


# ------------------------------
# Task 4: Restart NetworkManager
# ------------------------------

sudo systemctl restart NetworkManager

systemctl status NetworkManager


# ------------------------------
# Task 5: Hostname & DNS Configuration
# ------------------------------

sudo hostnamectl set-hostname mylabhost

hostnamectl

sudo nmcli connection modify "System eth0" ipv4.dns "1.1.1.1 1.0.0.1"

sudo nmcli connection modify "System eth0" ipv4.ignore-auto-dns yes


# ------------------------------
# Verification
# ------------------------------

ip addr show eth0

ping -c 4 8.8.8.8

nslookup google.com


# ------------------------------
# Troubleshooting Demonstration
# ------------------------------

sudo nmcli device disconnect eth0
sudo nmcli device connect eth0
sudo nmcli device reapply eth0
