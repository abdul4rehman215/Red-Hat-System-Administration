#!/bin/bash
# Lab 23 – Command Substitution
# Commands Executed During Lab (Sequential)

# Step 1: Create practice directory
mkdir command_substitution_lab
cd command_substitution_lab

# Step 2: Create sample files
touch file1.txt file2.log data.csv config.ini backup.tar.gz

# Verify sample files
ls

# Task 1: Basic command substitution using $()
echo "Today is $(date)"
echo "There are $(ls | wc -l) files in this directory"

# Task 1: Backtick syntax
echo "Today is `date`"

# Compare nesting behavior
echo "Test 1: $(echo $(date))"
echo "Test 2: `echo \`date\``"

# Task 2: Dynamic file operations
echo "Sample text content" > file1.txt
cat $(find . -name "*.txt")

echo -e "Log entry 1\nLog entry 2" > file2.log
wc -l $(find . -name "*.log")

# Advanced file operations - dated backup of ini files
tar czf config_backup_$(date +%Y%m%d).tar.gz $(find . -name "*.ini")

# Verify new backup file exists
ls

# Disk usage of files larger than 1MB
du -h $(find . -size +1M)

# Task 3: Build command pipelines
echo "There are $(ps aux | wc -l) processes running"

# Find largest file in directory
ls -S | head -n 1

# Nested command substitution - newest file modified time
echo "Newest file was modified at $(date -r $(ls -t | head -n 1))"

# Complex pipeline example - largest file with size
echo "The largest file is $(du -h $(find . -type f) | sort -h | tail -n 1)"

# Cleanup
cd ..
rm -rf command_substitution_lab

# Verify removal
ls
