#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set the backup script path
BACKUP_SCRIPT="${SCRIPT_DIR}/mysql.sh"

# Set the cron timing to 12:30 PM
CRON_EXPRESSION="0 9,11,14,18,22,0 * * *"

# Check if the cron job already exists
if crontab -l | grep -q "${BACKUP_SCRIPT}"; then
    echo "Cron job for backup script already exists."
else
    # Add a line to schedule the backup script in crontab
    (crontab -l 2>/dev/null; echo "${CRON_EXPRESSION} ${BACKUP_SCRIPT}") | crontab -
    echo "Cron job for backup script added successfully. Scheduled at 12:30 PM."
fi
