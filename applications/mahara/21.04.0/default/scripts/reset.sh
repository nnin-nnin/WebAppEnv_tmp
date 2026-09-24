#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "Resetting Mahara environment..."
cd "${APP_DIR}"

docker compose -f docker/compose.yaml down -v --remove-orphans
rm -f docker/compose.override.yaml /tmp/mahara_*cookie*.txt

echo "Reset complete."
