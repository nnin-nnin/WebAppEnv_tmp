#!/usr/bin/env bash
set -Eeuo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

docker compose -f docker/compose.yaml down -v --remove-orphans >/dev/null 2>&1 || true

# Also remove any stray standalone container
if docker inspect hotcrp >/dev/null 2>&1; then
  docker rm -f hotcrp >/dev/null 2>&1 || true
fi

for volume in hotcrp-db hotcrp-docs; do
  docker volume rm "$volume" >/dev/null 2>&1 || true
done

echo "已重置 HotCRP 3.3.1 容器及数据卷。"
