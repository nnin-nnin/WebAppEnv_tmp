#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "=== Resetting b2evolution Compose Project ==="
cd "${APP_DIR}"

docker compose -f docker/compose.yaml down -v --remove-orphans
echo "b2evolution compose environment reset completed."
