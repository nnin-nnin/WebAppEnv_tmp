#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Resetting Bonita BPM environment..."
cd "$APP_DIR"
if [ -f docker/compose.override.yaml ]; then
    docker compose -f docker/compose.yaml -f docker/compose.override.yaml down -v --remove-orphans
else
    docker compose -f docker/compose.yaml down -v --remove-orphans
fi
rm -f docker/compose.override.yaml

echo "Reset complete."
