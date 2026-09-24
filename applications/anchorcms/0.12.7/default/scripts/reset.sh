#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "=== Resetting AnchorCMS Compose Project ==="
cd "$APP_DIR"

docker compose -f docker/compose.yaml down -v --remove-orphans
echo "AnchorCMS compose environment reset completed."
