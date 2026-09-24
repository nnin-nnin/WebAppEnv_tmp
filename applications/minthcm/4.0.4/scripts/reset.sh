#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${APP_DIR}"

docker compose -f docker/compose.yaml down -v --remove-orphans >/dev/null 2>&1 || true
docker rm -f minthcm-4-0-4 minthcm-4-0-4-application-1 >/dev/null 2>&1 || true

echo "MintHCM 环境已重置"
