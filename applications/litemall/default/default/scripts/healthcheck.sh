#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18087}"

cd "$APP_DIR"

echo "Checking compose config..."
docker compose -f docker/compose.yaml config --quiet

echo "Checking service status..."
if ! docker compose -f docker/compose.yaml ps --status running --services | grep -q .; then
  echo "No services are running."
  exit 1
fi

echo "Checking HTTP endpoints..."
ADMIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/admin/auth/kaptcha" || true)
WX_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/wx/index/index" || true)

if [ "$ADMIN_CODE" = "200" ] || [ "$WX_CODE" = "200" ]; then
  echo "Healthcheck passed: admin kaptcha=$ADMIN_CODE, wx index=$WX_CODE"
  exit 0
fi

echo "Application healthcheck failed (admin: $ADMIN_CODE, wx: $WX_CODE)."
exit 1
