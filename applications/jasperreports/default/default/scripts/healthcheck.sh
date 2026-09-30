#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18832}"

cd "$APP_DIR"

echo "Checking compose config..."
docker compose -f docker/compose.yaml config --quiet

echo "Checking service status..."
if ! docker compose -f docker/compose.yaml ps --status running --services | grep -q .; then
  echo "No services are running."
  exit 1
fi

echo "Checking HTTP endpoint..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/jasperserver/login.html" || true)

if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
  echo "Healthcheck passed: HTTP $HTTP_CODE on /jasperserver/login.html"
  exit 0
fi

# Fallback root redirect check
ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
if [ "$ROOT_CODE" = "200" ] || [ "$ROOT_CODE" = "302" ]; then
  echo "Healthcheck passed: HTTP $ROOT_CODE on /"
  exit 0
fi

echo "Application HTTP endpoint check failed (login.html: $HTTP_CODE, /: $ROOT_CODE)."
exit 1
