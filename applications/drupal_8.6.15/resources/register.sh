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

if [[ $# -lt 2 || $# -gt 3 ]]; then
  echo "Usage: $0 <username> <password> [email]" >&2
  exit 2
fi

username="$1"
password="$2"
email="${3:-${username}@example.test}"

if [[ ${#password} -lt 8 ]]; then
  echo "Password must contain at least 8 characters." >&2
  exit 2
fi

compose=(docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE")
"${compose[@]}" exec -T \
  -e "NEW_USERNAME=$username" \
  -e "NEW_PASSWORD=$password" \
  -e "NEW_EMAIL=$email" \
  application php /opt/drupal-tools/create-user.php

APP_URL="$APP_URL" \
DRUPAL_USERNAME="$username" \
DRUPAL_PASSWORD="$password" \
  "$ROOT_DIR/resources/login.sh"
