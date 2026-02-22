#!/bin/bash
# ==========================================
# Lab 01 - Introduction to Red Hat Enterprise Linux
# Commands Executed During Lab
# ==========================================

# ------------------------------
# Task 1: Understanding Open Source
# ------------------------------

curl -s https://opensource.org/osd | grep -A5 "Open Source Definition"

# If curl was not installed
sudo dnf install curl -y


# ------------------------------
# Task 1.2: Check Linux Kernel Version
# ------------------------------

uname -r


# ------------------------------
# Task 2.1: Check Distribution Information
# ------------------------------

cat /etc/os-release


# ------------------------------
# Task 3.1: Check SELinux Status
# ------------------------------

sestatus


# ------------------------------
# Task 3.2: Register RHEL System
# ------------------------------

sudo subscription-manager register --username REDACTED --password REDACTED

sudo subscription-manager attach --auto

sudo subscription-manager list --consumed


# ------------------------------
# Troubleshooting (If Needed)
# ------------------------------

sudo dnf install subscription-manager -y
