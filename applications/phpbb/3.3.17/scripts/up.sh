#!/bin/bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
COMPOSE_FILE="$PROJECT_DIR/docker/compose.yaml"
docker compose -f "$COMPOSE_FILE" config --quiet
docker compose -f "$COMPOSE_FILE" up -d
echo "Waiting for services to be healthy..."
for attempt in {1..60}; do
  if docker compose -f "$COMPOSE_FILE" ps --status running | grep -q application && \
     docker compose -f "$COMPOSE_FILE" ps --status running | grep -q db && \
     curl -fsS http://127.0.0.1:38080/ >/dev/null; then
    echo "Services are up and healthy."
    exit 0
  fi
  sleep 5
done
docker compose -f "$COMPOSE_FILE" ps
docker compose -f "$COMPOSE_FILE" logs --tail=100
echo "Timed out waiting for phpBB." >&2
exit 1
