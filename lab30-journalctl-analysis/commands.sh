# ===============================
# Lab 30 – Analyzing System Logs with journalctl
# ===============================

# -------------------------------
# Task 1: Basic Log Queries
# -------------------------------

# Display all logs (paginated)
journalctl

# Verify journald service status
sudo systemctl status systemd-journald

# Filter logs from last hour
journalctl --since "1 hour ago"

# Filter logs between specific times
journalctl --since "09:00:00" --until "10:00:00"

# Filter logs by SSH unit
journalctl -u ssh

# Combine unit and time filter
journalctl -u ssh --since "today"

# -------------------------------
# Task 2: Priority and Boot Filters
# -------------------------------

# Show error-level logs only
journalctl -p err

# Show warning and higher
journalctl -p warning..emerg

# List all boot sessions
journalctl --list-boots

# View logs from current boot
journalctl -b

# View logs from previous boot
journalctl -b -1

# -------------------------------
# Task 3: Advanced Options
# -------------------------------

# Follow logs in real-time
journalctl -f

# JSON output format for structured analysis
journalctl -u ssh --since "1 hour ago" -o json

# Check journal disk usage
journalctl --disk-usage

# Vacuum journal logs to limit size
sudo journalctl --vacuum-size=100M

# -------------------------------
# Helpful Debugging Commands
# -------------------------------

journalctl --no-pager
journalctl -p debug
systemctl list-units
man journalctl
