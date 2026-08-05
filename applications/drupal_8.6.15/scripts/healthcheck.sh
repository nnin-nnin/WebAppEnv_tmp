#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_FILE="$ROOT_DIR/docker/compose.yaml"
ENV_FILE="$ROOT_DIR/docker/.env"
requested_app_url="${APP_URL-}"
requested_host_port="${DRUPAL_HOST_PORT-}"

set -a
. "$ENV_FILE"
set +a

if [[ -n "$requested_app_url" ]]; then APP_URL="$requested_app_url"; fi
if [[ -n "$requested_host_port" ]]; then DRUPAL_HOST_PORT="$requested_host_port"; fi

APP_URL="${APP_URL:-http://127.0.0.1:${DRUPAL_HOST_PORT:-18090}}"

compose=(docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE")
"${compose[@]}" config --quiet

db_id="$("${compose[@]}" ps -q db)"
application_id="$("${compose[@]}" ps -q application)"
installer_id="$("${compose[@]}" ps --all -q installer)"

if [[ -z "$db_id" || -z "$application_id" || -z "$installer_id" ]]; then
  echo "One or more required Compose services do not exist." >&2
  exit 1
fi

for service_id in "$db_id" "$application_id"; do
  status="$(docker inspect --format '{{.State.Status}}' "$service_id")"
  health="$(docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}none{{end}}' "$service_id")"
  if [[ "$status" != "running" || "$health" != "healthy" ]]; then
    echo "Container $service_id is status=$status health=$health" >&2
    exit 1
  fi
done

installer_status="$(docker inspect --format '{{.State.Status}}' "$installer_id")"
installer_exit="$(docker inspect --format '{{.State.ExitCode}}' "$installer_id")"
if [[ "$installer_status" != "exited" || "$installer_exit" != "0" ]]; then
  echo "Installer is status=$installer_status exit=$installer_exit" >&2
  exit 1
fi

"${compose[@]}" exec -T db pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB" >/dev/null
user_count="$("${compose[@]}" exec -T db psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -Atqc 'SELECT COUNT(*) FROM users_field_data;')"
if [[ ! "$user_count" =~ ^[1-9][0-9]*$ ]]; then
  echo "Drupal user table is missing or empty." >&2
  exit 1
fi

version="$("${compose[@]}" exec -T application php -r 'require "/var/www/html/core/lib/Drupal.php"; echo \Drupal::VERSION;')"
if [[ "$version" != "8.6.15" ]]; then
  echo "Unexpected Drupal version: $version" >&2
  exit 1
fi

root_status="$(curl --silent --show-error --output /dev/null --write-out '%{http_code}' "$APP_URL/")"
login_status="$(curl --silent --show-error --output /dev/null --write-out '%{http_code}' "$APP_URL/user/login")"
if [[ "$root_status" != "200" || "$login_status" != "200" ]]; then
  echo "Unexpected HTTP status: root=$root_status login=$login_status" >&2
  exit 1
fi

echo "Healthy: Drupal $version, db users=$user_count, root=$root_status, login=$login_status"
