# ===============================
# Lab 31 – Log Rotation with logrotate
# ===============================

# -------------------------------
# Setup Verification
# -------------------------------

# Install logrotate (if not already installed)
sudo yum install logrotate -y

# Verify installation
logrotate --version

# -------------------------------
# Task 1: Examine Configuration
# -------------------------------

# View main configuration file
sudo cat /etc/logrotate.conf

# List existing logrotate configurations
ls /etc/logrotate.d/

# Create custom logrotate configuration
sudo nano /etc/logrotate.d/mycustomlogs

# Verify configuration syntax (dry run)
sudo logrotate --debug /etc/logrotate.d/mycustomlogs

# -------------------------------
# Task 2: Force Log Rotation
# -------------------------------

# Perform verbose debug rotation
sudo logrotate --debug --verbose --force /etc/logrotate.d/mycustomlogs

# Execute actual forced rotation
sudo logrotate --force /etc/logrotate.d/mycustomlogs

# Verify rotated logs
ls -lh /var/log/messages*

# -------------------------------
# Task 3: Simulate Log Growth
# -------------------------------

# Generate test log entries
for i in {1..1000}; do echo "Test log entry $i" | sudo tee -a /var/log/messages > /dev/null; done

# Check log size
sudo du -sh /var/log/messages

# Trigger rotation again
sudo logrotate --force /etc/logrotate.d/mycustomlogs

# Verify rotation results
ls -lh /var/log/messages*

# Verify compression type
file /var/log/messages.1.gz

# -------------------------------
# Additional Verification
# -------------------------------

# Check cron configuration
ls /etc/cron.daily/logrotate

# Check disk usage
df -h /var

# Inspect logrotate status file
sudo cat /var/lib/logrotate/logrotate.status
