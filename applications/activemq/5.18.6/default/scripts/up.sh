#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting Apache ActiveMQ 5.18.6 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "ActiveMQ container started. Waiting for service readiness..."
sleep 5
