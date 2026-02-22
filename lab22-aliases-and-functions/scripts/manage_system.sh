#!/bin/bash
# Lab 22 – Aliases and Functions
# Script: manage_system.sh
# Purpose: Demonstrate usage of aliases inside scripts
# Environment: CentOS Linux 7 (Core)
# User: centos

# Enable alias expansion in scripts
shopt -s expand_aliases

# Source bashrc (loads aliases like 'update' and 'pps' if defined there)
source ~/.bashrc

# Use aliases
echo "System update starting..."
update

echo "Current containers:"
pps
