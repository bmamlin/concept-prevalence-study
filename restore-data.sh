docker compose down
docker compose run --rm \
  -v concept-prevalence-study:/volume \
  -v $(pwd):/backup \
  db sh -c "tar xzf /backup/concept-prevalence-study-backup.tar.gz -C /var/lib/mysql"
docker compose up -d