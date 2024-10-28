#!/bin/bash

# Check if a backup file is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <backup-file>"
  exit 1
fi

BACKUP_FILE=$1

# Bring down the Docker container
docker compose down

# Run the restore, using the specified backup file
docker compose run --rm \
  -v concept-prevalence-study:/volume \
  -v $(pwd):/backup \
  db sh -c "tar xzf /backup/$BACKUP_FILE -C /var/lib/mysql"

# Bring the Docker container back up
docker compose up -d