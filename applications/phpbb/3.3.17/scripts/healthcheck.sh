#!/bin/bash
set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
COMPOSE_FILE="$PROJECT_DIR/docker/compose.yaml"
docker compose -f "$COMPOSE_FILE" config --quiet
docker compose -f "$COMPOSE_FILE" ps | grep "application"
docker compose -f "$COMPOSE_FILE" ps | grep "db"
curl -s -f http://127.0.0.1:38080/ > /dev/null
echo "Healthcheck passed."
