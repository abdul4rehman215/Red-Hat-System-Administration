#!/bin/bash
# Lab 25 – Job Control
# Commands Executed During Lab

# Verify shell
echo $SHELL

# Create lab directory
mkdir job_control_lab && cd job_control_lab

# Task 1: Start background process
sleep 300 &

# Verify background job
jobs

# Task 2: Bring job to foreground
fg %1

# (User presses Ctrl + Z to suspend)

# Resume job in background
bg %1

# Verify job running
jobs

# Task 3: Graceful termination

# Show jobs with PID
jobs -l

# Terminate process (example PID)
kill 18472

# Verify termination
jobs
jobs

# Demonstrate force termination

sleep 200 &

# Example PID
kill -9 18503

# Verify kill
jobs

# Advanced Task: Podman container management

# Run container in detached mode
podman run -d --name lab_nginx nginx

# List running containers
podman ps

# Stop container
podman stop lab_nginx

# Verify container stopped
podman ps

# List available signals
kill -l

# Cleanup
cd ..
rm -rf job_control_lab
podman rm -f lab_nginx 2>/dev/null
