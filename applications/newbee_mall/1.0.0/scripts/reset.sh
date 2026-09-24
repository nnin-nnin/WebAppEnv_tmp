#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "Stopping and removing containers, networks, and volumes..."
docker compose -f docker/compose.yaml down -v

echo "Reset complete."
