#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting AbanteCart 1.4.4 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d

echo "Containers started. Waiting for application to initialize..."
sleep 10
