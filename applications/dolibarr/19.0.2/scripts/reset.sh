#!/usr/bin/env bash
set -Eeuo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

docker compose -f docker/compose.yaml down -v --remove-orphans >/dev/null 2>&1 || true

if docker inspect dolibarr-19.0.2 >/dev/null 2>&1; then
  docker rm -f dolibarr-19.0.2 >/dev/null 2>&1 || true
fi

echo "已重置 Dolibarr 19.0.2 容器及数据卷。"
