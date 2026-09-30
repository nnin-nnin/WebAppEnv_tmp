#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18834}"

cd "$APP_DIR"

echo "Checking compose config..."
docker compose -f docker/compose.yaml config --quiet

echo "Checking service status..."
if ! docker compose -f docker/compose.yaml ps --status running --services | grep -q .; then
  echo "No services are running."
  exit 1
fi

echo "Checking HTTP endpoints..."
HTTP_ROOT=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
HTTP_LOGIN=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/a/login" || true)

if [ "$HTTP_LOGIN" = "200" ] || [ "$HTTP_ROOT" = "200" ] || [ "$HTTP_ROOT" = "302" ]; then
  echo "Healthcheck passed: /a/login returned HTTP $HTTP_LOGIN (root returned HTTP $HTTP_ROOT)."
  exit 0
fi

echo "Application HTTP endpoint check failed (/a/login: $HTTP_LOGIN, root: $HTTP_ROOT)."
exit 1
