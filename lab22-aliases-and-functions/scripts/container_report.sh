#!/bin/bash
# Lab 22 – Aliases and Functions
# Script: container_report.sh
# Purpose: Generate a basic container report using functions and Podman
# Environment: CentOS Linux 7 (Core)
# User: centos

# Container management script
function container_report() {
 echo "=== Container Report ==="
 pps
 echo "Disk Usage:"
 podman system df
}

container_report
