#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

echo "Stopping and removing containers and networks..."
docker compose -p joomla-6-1-2 -f docker/compose.yaml down -v

echo "Reset complete."
