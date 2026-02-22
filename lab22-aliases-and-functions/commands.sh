#!/bin/bash
# Lab 22 – Aliases and Functions
# Commands Executed During Lab 

# Verify Bash installation
bash --version

# Verify Podman installation
podman --version

# Create temporary aliases
alias ll='ls -alF'
alias pps='podman ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"'

# Test temporary aliases
ll
pps

# Edit bashrc for persistent aliases
nano ~/.bashrc
source ~/.bashrc

# Test persistent aliases
c
update

# Create basic function
function pcount() {
 podman ps -a
 echo "Total containers: $(podman ps -a -q | wc -l)"
}

# Run function
pcount

# Create function with parameters
function cstate() {
 if [ "$1" = "start" ]; then
  podman start $2
 elif [ "$1" = "stop" ]; then
  podman stop $2
 else
  echo "Usage: cstate [start|stop] [container]"
 fi
}

# Use parameterized function
cstate start db_container

# Append persistent cleanup function
echo '
# Container cleanup function
function pclean() {
 podman container prune -f
 podman image prune -a -f
}' >> ~/.bashrc

# Reload configuration
source ~/.bashrc

# Run cleanup function
pclean

# Create script using aliases
nano manage_system.sh
chmod +x manage_system.sh
./manage_system.sh

# Create advanced script using functions
nano container_report.sh
chmod +x container_report.sh
./container_report.sh

# Cleanup temporary aliases
unalias ll
unalias pps

