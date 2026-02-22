# ==========================================
# Lab 36 – Adjusting CPU Scheduling
# nice & renice (CentOS 7)
# ==========================================


# ------------------------------------------------
# PREREQUISITE SETUP
# ------------------------------------------------

# Update system
sudo yum update -y

# Install htop (if not installed)
sudo yum install htop -y

# Verify installation
htop --version


# ------------------------------------------------
# TASK 1: Understanding Default Priority
# ------------------------------------------------

# Launch CPU-intensive process
dd if=/dev/zero of=/dev/null &

# Capture PID of most recent dd process
pgrep -n dd

# Check priority (PRI) and nice value (NI)
ps -l -p $(pgrep -n dd)


# ------------------------------------------------
# TASK 2: Launch Process with Custom Nice Value
# ------------------------------------------------

# Start process with lower priority (nice 10)
nice -n 10 dd if=/dev/zero of=/dev/null &

# Verify new process priority
ps -l -p $(pgrep -n dd)


# ------------------------------------------------
# TASK 3: Adjust Running Process Priority (renice)
# ------------------------------------------------

# List running dd processes
pgrep -l dd

# Lower priority further (increase nice value)
sudo renice -n 15 -p <PID>

# Verify change
ps -l -p <PID>

# Increase priority (negative nice requires root)
sudo renice -n -5 -p <PID>

# Verify again
ps -l -p <PID>


# ------------------------------------------------
# TASK 4: Monitor CPU Impact
# ------------------------------------------------

# Launch htop for live monitoring
htop

# Inside htop:
# - Press F6 to sort by CPU%
# - Observe CPU% differences based on NI values


# ------------------------------------------------
# TASK 5: Create Priority Competition
# ------------------------------------------------

# Lowest priority process
nice -n 19 dd if=/dev/zero of=/dev/null &

# Highest priority process (requires sudo)
sudo nice -n -5 dd if=/dev/zero of=/dev/null &

# Monitor again in htop


# ------------------------------------------------
# CLEANUP
# ------------------------------------------------

# Stop all dd processes
pkill dd

# Verify no processes remain
pgrep dd
