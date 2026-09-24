#!/usr/bin/env bash
set -euo pipefail

# Strip local proxies
export http_proxy=""
export https_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export all_proxy=""
export ALL_PROXY=""
export no_proxy="*"
export NO_PROXY="*"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"

echo "Resetting Serendipity environment..."
docker compose -f "$COMPOSE_FILE" down -v --remove-orphans

echo "Reset complete."
