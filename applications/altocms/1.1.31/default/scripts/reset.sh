#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"

echo "Resetting AltoCMS Compose project (stopping containers and deleting named volumes)..."
docker compose -f "$COMPOSE_FILE" down -v

echo "AltoCMS Compose project reset complete."
