#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd -- "$script_dir/.." && pwd)"
compose_file="$project_dir/docker/compose.yaml"

cd "$project_dir"
docker compose -f "$compose_file" config --quiet

required_images=(
  yorem/sop-monica-app:4.1.2
  yorem/sop-monica-web:4.1.2
  mariadb:11.4.2
  redis:7.2.5-alpine
  mailhog/mailhog:v1.0.1
)
missing_image=false
for image in "${required_images[@]}"; do
  if ! docker image inspect "$image" >/dev/null 2>&1; then
    missing_image=true
  fi
done
if [[ "$missing_image" == true ]]; then
  archive_ready=true
  for archive in \
    monica-app-4.1.2-linux-amd64.tar \
    monica-web-4.1.2-linux-amd64.tar \
    mariadb-11.4.2-linux-amd64.tar \
    redis-7.2.5-linux-amd64.tar \
    mailhog-1.0.1-linux-amd64.tar; do
    if [[ ! -s "$project_dir/image/$archive" ]]; then
      archive_ready=false
      break
    fi
  done
  if [[ "$archive_ready" == true ]]; then
    "$script_dir/load-images.sh"
  else
    docker compose -f "$compose_file" pull
  fi
fi

docker compose -f "$compose_file" up -d

services=(db redis app web cron queue mail)
deadline=$((SECONDS + 180))
while (( SECONDS < deadline )); do
  all_healthy=true
  for service in "${services[@]}"; do
    container_id="$(docker compose -f "$compose_file" ps -q "$service")"
    if [[ -z "$container_id" ]]; then
      all_healthy=false
      continue
    fi
    state="$(docker inspect -f '{{.State.Status}}' "$container_id")"
    health="$(docker inspect -f '{{if .State.Health}}{{.State.Health.Status}}{{else}}no-healthcheck{{end}}' "$container_id")"
    if [[ "$state" != running || "$health" != healthy ]]; then
      all_healthy=false
    fi
  done
  if [[ "$all_healthy" == true ]]; then
    echo "Monica 4.1.2 Compose services are healthy"
    docker compose -f "$compose_file" ps
    exit 0
  fi
  sleep 2
done

echo "Monica Compose did not become healthy within 180 seconds" >&2
docker compose -f "$compose_file" ps >&2
docker compose -f "$compose_file" logs --tail=80 app web db redis cron queue mail >&2 || true
exit 1
