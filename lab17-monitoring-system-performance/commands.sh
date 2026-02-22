#!/usr/bin/env bash
# Lab 17: Monitoring System Performance and Resource Usage

# --- Task 1: Monitor CPU Usage ---

# Check overall CPU usage (interactive)
top

# Install sysstat (for mpstat)
sudo dnf install sysstat -y

# Snapshot CPU usage across all cores (5 samples, 1-second interval)
mpstat -P ALL 1 5


# --- Task 2: Monitor Memory Usage ---

# Check free/used memory
free -h

# Sort processes by memory (interactive)
top -o %MEM


# --- Task 3: Monitor Disk Usage ---

# Check filesystem usage
df -h

# Check disk usage by directory under /var/log
du -sh /var/log/*

# Install iotop
sudo dnf install iotop -y

# Monitor disk I/O for processes currently doing I/O (interactive)
sudo iotop -o


# --- Task 4: Monitor Network Usage ---

# Show listening ports and active services with PIDs
ss -tulnp

# Install nload (real-time bandwidth monitor)
sudo dnf install nload -y

# Run nload (interactive)
nload


# --- Task 5: Analyze Running Processes ---

# Show top CPU-consuming processes
ps aux --sort=-%cpu | head -n 5

# Show top memory-consuming processes
ps aux --sort=-%mem | head -n 5

# Show container resource usage (interactive)
podman stats


# --- Task 6: Detect Resource Exhaustion ---

# Check boot logs for errors only
journalctl -p err -b

# Install stress-ng (load generator)
sudo dnf install stress-ng -y

# Simulate high CPU + memory load for 30 seconds
stress-ng --cpu 4 --vm 2 --timeout 30s


# --- Final Verification ---

# Show uptime and load average
uptime
