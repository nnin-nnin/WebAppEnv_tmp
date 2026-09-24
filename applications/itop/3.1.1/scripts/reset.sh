#!/bin/bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${APP_DIR}"

docker compose -f docker/compose.yaml down -v --remove-orphans >/dev/null 2>&1 || true
docker rm -f itop >/dev/null 2>&1 || true
docker volume rm itop-data itop-db >/dev/null 2>&1 || true

echo "iTop 环境已重置"
