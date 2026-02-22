#!/bin/bash
# Lab 26 – Environment and Shell Variables
# Commands Executed During Lab

# Task 1: Working with Environment Variables

# List all environment variables
printenv

# View specific variables
echo $HOME
echo $PATH

# Set temporary environment variable
export LAB_USER="dev_user"

# Verify variable
echo $LAB_USER

# Make variable persistent
nano ~/.bashrc

# Reload configuration
source ~/.bashrc

# Verify persistent variable
echo $PROJECT_DIR


# Task 2: Shell Variables in Scripts

# Create variables script
nano variables.sh

# Make executable
chmod +x variables.sh

# Run script
./variables.sh


# Variable scope demonstration

# Create scope demo script
nano scope_demo.sh

# Make executable
chmod +x scope_demo.sh

# Run script
./scope_demo.sh


# Task 3: Automation with Variables

# Create configuration file
nano config.cfg

# Create application script
nano app.sh

# Make executable
chmod +x app.sh

# Run script
./app.sh

# Verify backup directory
ls -ld /var/backups


# Create system report script
nano system_report.sh

# Make executable
chmod +x system_report.sh

# Run script
./system_report.sh
