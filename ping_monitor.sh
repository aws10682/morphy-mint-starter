#!/bin/bash

# Script to ping Google every 10 seconds and log results
# Press Ctrl+C to stop and save final message

LOG_FILE="ping_results.txt"
TARGET="google.com"

# Function to handle Ctrl+C
cleanup() {
    echo "=== Monitoring stopped at $(date) ===" >> "$LOG_FILE"
    echo "Results saved to $LOG_FILE"
    exit 0
}

# Set up trap for Ctrl+C
trap cleanup SIGINT

# Create or clear the log file
echo "=== Ping Monitoring Started at $(date) ===" > "$LOG_FILE"
echo "Target: $TARGET" >> "$LOG_FILE"
echo "Interval: 10 seconds" >> "$LOG_FILE"
echo "==========================================" >> "$LOG_FILE"

echo "Ping monitoring started. Press Ctrl+C to stop."
echo "Results are being saved to: $LOG_FILE"

# Infinite loop with ping
while true; do
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] Pinging $TARGET..." >> "$LOG_FILE"
    
    # Ping with 4 packets and append output to file
    ping -c 4 "$TARGET" >> "$LOG_FILE" 2>&1
    
    echo "----------------------------------------" >> "$LOG_FILE"
    sleep 10
done
