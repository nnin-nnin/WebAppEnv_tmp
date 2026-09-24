#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "Validating Docker Compose configuration..."
docker compose -f "${APP_DIR}/docker/compose.yaml" config --quiet

echo "Starting services..."
docker compose -f "${APP_DIR}/docker/compose.yaml" up -d

echo "Waiting for services to become healthy..."
TIMEOUT=180
ELAPSED=0

while [ $ELAPSED -lt $TIMEOUT ]; do
  UNHEALTHY=$(docker compose -f "${APP_DIR}/docker/compose.yaml" ps --format json 2>/dev/null | grep -iE "unhealthy|starting" || true)
  if [ -z "$UNHEALTHY" ]; then
    RUNNING=$(docker compose -f "${APP_DIR}/docker/compose.yaml" ps -q)
    if [ -n "$RUNNING" ]; then
      echo "All services are running and healthy!"
      docker compose -f "${APP_DIR}/docker/compose.yaml" ps
      exit 0
    fi
  fi
  sleep 3
  ELAPSED=$((ELAPSED + 3))
done

echo "Error: Services failed to achieve healthy status within ${TIMEOUT} seconds."
docker compose -f "${APP_DIR}/docker/compose.yaml" ps
docker compose -f "${APP_DIR}/docker/compose.yaml" logs --tail 50
exit 1
