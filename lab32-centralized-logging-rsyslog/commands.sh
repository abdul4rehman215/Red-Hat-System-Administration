# ==========================================
# Lab 32 – Using rsyslog for Centralized Logging
# Server: 192.168.1.100 (logserver.example.com)
# Client: 192.168.1.101 (client.example.com)
# OS: CentOS 7 (Core)
# User: centos (sudo privileges)
# ==========================================

# ------------------------------------------------
# TASK 1: Install rsyslog on both systems
# ------------------------------------------------

# [SERVER] Install rsyslog
sudo yum install -y rsyslog

# [CLIENT] Install rsyslog
sudo yum install -y rsyslog


# ------------------------------------------------
# TASK 2: Configure rsyslog SERVER (192.168.1.100)
# ------------------------------------------------

# [SERVER] Edit rsyslog configuration
sudo nano /etc/rsyslog.conf

# [SERVER] Create remote log directory
sudo mkdir -p /var/log/remotehost
sudo chmod 755 /var/log/remotehost

# [SERVER] Restart and enable rsyslog
sudo systemctl restart rsyslog
sudo systemctl enable rsyslog

# [SERVER] Open firewall ports for syslog (TCP/UDP 514)
sudo firewall-cmd --add-port=514/tcp --permanent
sudo firewall-cmd --add-port=514/udp --permanent
sudo firewall-cmd --reload

# [SERVER] Verify rsyslog is listening
sudo ss -tulnp | grep 514


# ------------------------------------------------
# TASK 3: Configure rsyslog CLIENT (192.168.1.101)
# ------------------------------------------------

# [CLIENT] Edit rsyslog configuration to forward logs
sudo nano /etc/rsyslog.conf

# [CLIENT] Restart rsyslog and verify status
sudo systemctl restart rsyslog
sudo systemctl status rsyslog


# ------------------------------------------------
# TASK 4: Test log forwarding
# ------------------------------------------------

# [CLIENT] Send a test log message
logger "This is a test message from client"

# [SERVER] Verify remote directory exists
sudo ls /var/log/remotehost/

# [SERVER] Tail forwarded logs
sudo tail -f /var/log/remotehost/client.example.com/logger.log


# ------------------------------------------------
# TASK 5: Analyze centralized logs
# ------------------------------------------------

# [SERVER] Live system logs view
journalctl -f

# [SERVER] View remote host logs
sudo ls /var/log/remotehost/client.example.com/

# [SERVER] Search for errors across client logs
sudo grep "error" /var/log/remotehost/client.example.com/*.log


# ------------------------------------------------
# OPTIONAL: Advanced / Troubleshooting
# ------------------------------------------------

# [CLIENT] Test connectivity to server port 514 (if telnet installed)
telnet 192.168.1.100 514

# [SERVER/CLIENT] Check rsyslog service status
sudo systemctl status rsyslog

# [SERVER] Follow local system log file
sudo tail -f /var/log/messages

# [SERVER/CLIENT] SELinux test mode (if blocking)
sudo setenforce 0


# ------------------------------------------------
# CLEANUP (Optional)
# ------------------------------------------------

# [CLIENT] Remove forwarding line from /etc/rsyslog.conf (manual edit)

# [SERVER] Remove remote logs directory
sudo rm -rf /var/log/remotehost

# [SERVER] Remove firewall rules
sudo firewall-cmd --remove-port=514/tcp --permanent
sudo firewall-cmd --remove-port=514/udp --permanent
sudo firewall-cmd --reload
