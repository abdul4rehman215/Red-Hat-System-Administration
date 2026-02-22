# ==========================================
# Lab 35 – Tuning Kernel Parameters with sysctl
# Environment: Ubuntu 24.04.1 LTS
# User: toor (sudo)
# ==========================================


# ------------------------------------------------
# TASK 1: View Kernel Parameters
# ------------------------------------------------

# List all kernel parameters
sudo sysctl -a

# View specific parameter
sudo sysctl vm.swappiness


# ------------------------------------------------
# Modify Kernel Parameter (Temporary)
# ------------------------------------------------

# Reduce swappiness
sudo sysctl -w vm.swappiness=10

# Verify change
sudo sysctl vm.swappiness


# ------------------------------------------------
# TASK 2: Network Tuning
# ------------------------------------------------

# Increase connection backlog
sudo sysctl -w net.core.somaxconn=1024

# Enable TCP Fast Open (client + server)
sudo sysctl -w net.ipv4.tcp_fastopen=3

# Verify network parameters
sudo sysctl net.core.somaxconn net.ipv4.tcp_fastopen


# ------------------------------------------------
# Memory Tuning
# ------------------------------------------------

# Ensure swappiness remains low
sudo sysctl -w vm.swappiness=10

# Increase file descriptor limit
sudo sysctl -w fs.file-max=2097152

# Verify memory settings
sudo sysctl vm.swappiness fs.file-max


# ------------------------------------------------
# TASK 3: Persist Changes (Method 1)
# ------------------------------------------------

# Edit main sysctl config
sudo nano /etc/sysctl.conf

# Add:
# vm.swappiness = 10
# net.core.somaxconn = 1024
# net.ipv4.tcp_fastopen = 3
# fs.file-max = 2097152

# Reload configuration
sudo sysctl -p


# ------------------------------------------------
# Persistent Method 2 (Recommended)
# ------------------------------------------------

# Create modular config file
sudo nano /etc/sysctl.d/99-custom.conf

# Add same parameters:
# vm.swappiness = 10
# net.core.somaxconn = 1024
# net.ipv4.tcp_fastopen = 3
# fs.file-max = 2097152

# Apply all sysctl configs
sudo sysctl --system


# ------------------------------------------------
# Verification After Persistence
# ------------------------------------------------

sudo sysctl vm.swappiness \
net.core.somaxconn \
net.ipv4.tcp_fastopen \
fs.file-max


# ------------------------------------------------
# Optional Performance Monitoring
# ------------------------------------------------

vmstat 2
dstat
netstat -s


# ------------------------------------------------
# Revert Example (If Needed)
# ------------------------------------------------

# Restore default swappiness
sudo sysctl -w vm.swappiness=60

# Remove custom config if reverting permanently
sudo rm /etc/sysctl.d/99-custom.conf
sudo sysctl --system
