#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Resetting NewBee Mall environment..."
cd "$APP_DIR"

echo "Stopping and removing containers, networks, and volumes..."
docker compose -f docker/compose.yaml down -v --remove-orphans

echo "Reset complete."
