#!/usr/bin/env bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"
COMPOSE_FILE="${BASE_DIR}/docker/compose.yaml"

echo "[*] Resetting Alfresco multi-container Compose project..."
docker compose -f "${COMPOSE_FILE}" down -v --remove-orphans

echo "[+] Reset complete. Containers, networks, and named volumes for alfresco-26.3.0.19 removed."
