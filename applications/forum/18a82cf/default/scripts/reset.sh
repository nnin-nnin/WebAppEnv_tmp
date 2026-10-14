#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
echo "[reset] Tearing down forum environment and volumes..."
docker compose -f "$ENV_DIR/docker/compose.yaml" down -v --remove-orphans
echo "[reset] Done."
