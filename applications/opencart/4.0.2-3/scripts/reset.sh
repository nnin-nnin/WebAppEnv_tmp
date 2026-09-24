#!/usr/bin/env bash
set -Eeuo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

docker compose -f docker/compose.yaml down -v --remove-orphans >/dev/null 2>&1 || true

if docker inspect opencart-4-0-2-3 >/dev/null 2>&1; then
  docker rm -f opencart-4-0-2-3 >/dev/null 2>&1 || true
fi

echo "已重置 OpenCart 4.0.2-3 容器及数据卷。"
