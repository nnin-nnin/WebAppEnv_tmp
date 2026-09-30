#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"

echo "=== Tearing down FatFreeCRM environment and removing volumes ==="
docker compose -f "${COMPOSE_FILE}" down -v --remove-orphans

echo "[+] FatFreeCRM environment successfully reset."
