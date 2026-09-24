#!/usr/bin/env bash
set -Eeuo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

docker compose -f docker/compose.yaml down -v --remove-orphans >/dev/null 2>&1 || true

# Also remove any stray standalone container
if docker inspect moodle-app >/dev/null 2>&1; then
  docker rm -f moodle-app >/dev/null 2>&1 || true
fi

for volume in moodle-data moodle-db; do
  docker volume rm "$volume" >/dev/null 2>&1 || true
done

echo "已重置 Moodle 4.4.0 容器及数据卷。"
