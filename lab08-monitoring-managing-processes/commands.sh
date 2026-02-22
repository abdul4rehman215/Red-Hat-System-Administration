#!/bin/bash
# ==========================================
# Lab 08 - Monitoring and Managing Processes
# Commands Executed During Lab
# ==========================================


# ------------------------------
# Task 1: Viewing Processes
# ------------------------------

pwd

ps aux | head

ps aux | grep sshd

top

sudo dnf install htop -y

htop


# ------------------------------
# Task 2: Sending Signals
# ------------------------------

# Start test process
sleep 300 &

# Find PID
pidof sleep

# Graceful termination
kill 1250

# Force termination
sleep 300 &
kill -9 1284

# Kill by name
sleep 300 &
pkill sleep


# ------------------------------
# Task 3: Job Control
# ------------------------------

sleep 300 &

jobs

fg %1

# (Pressed Ctrl + Z)

bg %1


# ------------------------------
# Task 4: Adjusting Priority
# ------------------------------

nice -n 10 sleep 300 &

ps -o pid,ni,cmd -p 1378

pgrep sleep

sudo renice -n 15 -p 1378

ps -o pid,ni,cmd -p 1378
