docker compose down
docker compose run --rm \
  -v concept-prevalence-study:/volume \
  -v $(pwd):/backup \
  db tar czf /backup/concept-prevalence-study-backup.tar.gz -C /volume .
docker compose up -d