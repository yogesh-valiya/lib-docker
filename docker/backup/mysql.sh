#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set variables
BACKUP_DIR="${SCRIPT_DIR}/archive"
MYSQL_CONTAINER_NAME="mariadb104"
MYSQL_ROOT_PASSWORD="magento"

# Ensure the backup directory exists
mkdir -p ${BACKUP_DIR}

# Get the current date for backup file naming
DATE=$(date +"%Y%m%d_%H%M%S")

# Get a list of databases
DATABASES=$(docker exec ${MYSQL_CONTAINER_NAME} mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema|mysql|sys)")

# Loop through each database and create a compressed backup
for DB in $DATABASES; do
    mkdir -p ${BACKUP_DIR}/${DB}
    docker exec ${MYSQL_CONTAINER_NAME} mysqldump -u root -p${MYSQL_ROOT_PASSWORD} --single-transaction --databases ${DB} | gzip > ${BACKUP_DIR}/${DB}/${DATE}.sql.gz
done

# Delete backups older than 7 days
find ${BACKUP_DIR} -type f -name "*.sql.gz" -mtime +7 -exec rm {} \;
