# ===============================
# Lab 29 – Systemd Timers
# ===============================

# Verify systemd version
systemctl --version

# List existing timers
systemctl list-timers --all

# -------------------------------
# Task 1: Create Maintenance Service
# -------------------------------

sudo nano /etc/systemd/system/maintenance.service

# Create Maintenance Timer
sudo nano /etc/systemd/system/maintenance.timer

# Reload systemd daemon
sudo systemctl daemon-reload

# Enable and start timer
sudo systemctl enable --now maintenance.timer

# Verify timer status
systemctl status maintenance.timer

# -------------------------------
# Task 2: Create Complex Backup Timer
# -------------------------------

sudo nano /etc/systemd/system/backup.timer

# Validate calendar expression
systemd-analyze calendar "Mon *-*-* 02:00:00"

# -------------------------------
# Task 3: Modify Existing Timer
# -------------------------------

sudo nano /etc/systemd/system/maintenance.timer

# Reload daemon after modification
sudo systemctl daemon-reload

# List active timers
systemctl list-timers

# -------------------------------
# Monitoring and Logs
# -------------------------------

journalctl -u maintenance.service

systemd-analyze calendar --iterations=5 "hourly"

systemctl status maintenance.timer
systemctl status maintenance.service

journalctl -xe

# -------------------------------
# Cleanup
# -------------------------------

sudo systemctl stop maintenance.timer
sudo rm /etc/systemd/system/maintenance.service
sudo rm /etc/systemd/system/maintenance.timer
sudo systemctl daemon-reload
