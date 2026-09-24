#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$APP_DIR"

docker compose -f docker/compose.yaml down -v --remove-orphans
docker rm -f gitlab-16.11.2-ce.0 2>/dev/null || true
