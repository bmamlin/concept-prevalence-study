#!/bin/bash

# Get the current date in YYYYMMDD format
DATE=$(date +%Y%m%d)

# Bring down the Docker container
docker compose down

# Run the backup, adding the date to the filename
docker compose run --rm \
  -v concept-prevalence-study:/volume \
  -v $(pwd):/backup \
  db tar czf /backup/concept-prevalence-study-backup-$DATE.tar.gz -C /volume .

# Bring the Docker container back up
docker compose up -d