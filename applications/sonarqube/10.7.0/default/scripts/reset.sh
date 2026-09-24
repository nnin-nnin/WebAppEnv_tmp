#!/usr/bin/env bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"

echo "[*] Resetting SonarQube Compose project..."
docker compose -f "${COMPOSE_FILE}" down -v --remove-orphans

echo "[+] Reset complete. Containers, networks, and volumes removed."
