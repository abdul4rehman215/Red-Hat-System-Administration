#!/bin/bash
# Lab 24 – Brace Expansion and Globbing
# Commands Executed During Lab

# Step 1: Create working directory
mkdir lab4_brace_globbing && cd lab4_brace_globbing

# Task 1: Brace Expansion Fundamentals

# Numeric brace expansion
echo file_{1..5}.txt

# Create multiple report log files
touch report_{jan,feb,mar}_2023.log

# Verify created files
ls -l report_*.log

# Task 2: Globbing Patterns

# List all .log files
ls *.log

# List files starting with report
ls report_*

# Advanced pattern matching (no matches expected)
ls report_[0-9]*.log
ls report_[abc]*.log

# Task 3: Combining Brace Expansion and Globbing

# Create nested directory structure
mkdir -p projects/{src,bin,doc}/{web,cli,api}_{dev,prod}

# Verify directory structure
tree projects/

# Bulk file creation
touch file_{a..d}{1..3}.tmp

# Verify tmp files
ls file_*.tmp

# Create backup directory
mkdir backup

# Move specific files using globbing pattern
mv file_[a-b]?.tmp backup/

# Verify moved files
ls backup/

# Verification Exercises

# Create 10 test files
touch data_{01..10}.txt

# List files ending with even numbers
ls data_*[02468].txt

# Copy files containing 1 or 3
mkdir filtered
cp data_*[13].txt filtered/

# Verify filtered files
ls filtered/

# Enable extended globbing
shopt -s extglob

# Cleanup
cd ..
rm -rf lab4_brace_globbing

# Verify cleanup
ls
