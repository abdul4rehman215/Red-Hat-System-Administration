#!/bin/bash

# Load configuration file
source config.cfg

echo "Running with:"
echo "Retries: $MAX_RETRIES"
echo "Log Level: $LOG_LEVEL"

# Create backup directory if not exists
mkdir -p $BACKUP_DIR
