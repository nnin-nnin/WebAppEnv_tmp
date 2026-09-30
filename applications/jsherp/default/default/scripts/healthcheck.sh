#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18836}"

cd "$APP_DIR"

echo "Checking compose config..."
docker compose -f docker/compose.yaml config --quiet

echo "Checking service status..."
if ! docker compose -f docker/compose.yaml ps --status running --services | grep -q .; then
  echo "No services are running."
  exit 1
fi

echo "Checking HTTP frontend endpoint..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)

if [ "$HTTP_CODE" != "200" ] && [ "$HTTP_CODE" != "302" ]; then
  echo "Healthcheck failed on /: HTTP $HTTP_CODE"
  exit 1
fi

echo "Checking API backend endpoint..."
API_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/jshERP-boot/user/randomImage" || true)
if [ "$API_CODE" != "200" ]; then
  echo "Healthcheck failed on /jshERP-boot/user/randomImage: HTTP $API_CODE"
  exit 1
fi

echo "Healthcheck passed: frontend HTTP $HTTP_CODE, backend API HTTP $API_CODE."
exit 0
