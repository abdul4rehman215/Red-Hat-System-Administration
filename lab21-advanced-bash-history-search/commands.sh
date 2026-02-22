#!/bin/bash
# Lab 01 – Advanced Bash History and Search
# Commands Executed During Lab (Sequential)

# Step 1: Verify Bash version
bash --version

# Step 2: Clear current history
history -c

# Task 1: Execute sample commands (populate history)
echo "Hello World"
ls -l
date
whoami

# Task 1: Reverse search actions (interactive)
# Ctrl+R then type: echo
# Enter to execute selected command
echo "Hello World"

# Task 2: Create more history entries
grep "error" /var/log/syslog
find ~ -name "*.txt"
docker ps -a

# Task 2: Reverse search actions (interactive)
# Ctrl+R then type: docker
docker ps -a

# Ctrl+R then type: find name
find ~ -name "*.txt"

# Task 2: Modify found command
ls -la

# Task 3: Edit bashrc for persistent config
nano ~/.bashrc
source ~/.bashrc

# Task 3: Add history search aliases
nano ~/.bashrc
source ~/.bashrc

# Test aliases
hs docker
hsi ERROR

# Task 3: Add advanced history function
nano ~/.bashrc
source ~/.bashrc

# Run advanced history function
hst
