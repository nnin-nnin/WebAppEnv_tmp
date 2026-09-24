#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Resetting AbanteCart environment..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml down -v
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d

echo "Reset complete. Waiting for containers to initialize..."
sleep 10
