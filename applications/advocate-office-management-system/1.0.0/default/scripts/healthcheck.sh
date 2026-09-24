#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
PORT=18004

echo "Validating Docker Compose configuration..."
docker compose -f "${APP_DIR}/docker/compose.yaml" config --quiet

echo "Checking container status..."
CONTAINERS=$(docker compose -f "${APP_DIR}/docker/compose.yaml" ps -q)
if [ -z "$CONTAINERS" ]; then
  echo "Error: No active containers found."
  exit 1
fi

echo "Checking HTTP availability at http://localhost:${PORT}/..."
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${PORT}/" || echo "000")

if [ "$STATUS_CODE" -eq 200 ] || [ "$STATUS_CODE" -eq 302 ]; then
  echo "HTTP endpoint check passed (status: ${STATUS_CODE})."
else
  echo "Error: HTTP endpoint returned status code ${STATUS_CODE}."
  docker compose -f "${APP_DIR}/docker/compose.yaml" ps
  docker compose -f "${APP_DIR}/docker/compose.yaml" logs --tail 30
  exit 1
fi

echo "Running authentication check via resources/login.sh..."
bash "${APP_DIR}/resources/login.sh"

echo "Healthcheck completed successfully!"
exit 0
