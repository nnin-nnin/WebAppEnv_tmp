#!/bin/bash
set -e
cd "$(dirname "$0")/.."

echo "Stopping and removing containers, networks..."
docker compose -f docker/compose.yaml down -v
echo "Reset complete."
