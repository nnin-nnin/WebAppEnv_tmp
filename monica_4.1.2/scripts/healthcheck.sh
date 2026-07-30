#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd -- "$script_dir/.." && pwd)"
compose_file="$project_dir/docker/compose.yaml"
base_url="${APP_URL:-http://localhost:18086}"

cd "$project_dir"
docker compose -f "$compose_file" config --quiet

for service in db redis app web cron queue mail; do
  container_id="$(docker compose -f "$compose_file" ps -q "$service")"
  test -n "$container_id"
  test "$(docker inspect -f '{{.State.Status}}' "$container_id")" = running
  test "$(docker inspect -f '{{if .State.Health}}{{.State.Health.Status}}{{else}}no-healthcheck{{end}}' "$container_id")" = healthy
done

body_file="$(mktemp)"
trap 'rm -f "$body_file"' EXIT
status="$(curl -sS --max-time "${APP_TIMEOUT:-20}" -L -o "$body_file" -w '%{http_code}' "$base_url/")"
test "$status" = 200
grep -Eiq 'Monica|login|sign in' "$body_file"

APP_URL="$base_url" "$project_dir/resources/login.sh"
echo "Monica Compose healthcheck passed: $base_url"
