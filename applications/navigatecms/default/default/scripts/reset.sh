#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "=== Resetting NavigateCMS Environment ==="
cd "${APP_DIR}"

docker compose -f docker/compose.yaml down -v --remove-orphans
echo "=== NavigateCMS Environment Reset Completed ==="
