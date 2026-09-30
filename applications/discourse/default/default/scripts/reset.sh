#!/usr/bin/env bash
set -Eeuo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

docker compose -f docker/compose.yaml down -v --remove-orphans >/dev/null 2>&1 || true

container_ids=$(docker compose -f docker/compose.yaml ps -q 2>/dev/null || true)
if [[ -n "$container_ids" ]]; then
  docker rm -f $container_ids >/dev/null 2>&1 || true
fi

echo "已重置 Discourse default 容器及数据卷。"
