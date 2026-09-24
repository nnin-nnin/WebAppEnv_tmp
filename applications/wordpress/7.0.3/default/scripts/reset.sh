#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_FILE="$DIR/docker/compose.yaml"
export COMPOSE_PROJECT_NAME=wordpress-7-0-3

echo "Resetting Compose environment..."
docker compose -f "$COMPOSE_FILE" down -v --remove-orphans

echo "Reset complete."
