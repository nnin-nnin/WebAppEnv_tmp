#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Resetting Let's Chat environment..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml down -v --remove-orphans

echo "Reset complete."
