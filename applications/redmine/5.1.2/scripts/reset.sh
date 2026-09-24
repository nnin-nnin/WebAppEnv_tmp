#!/usr/bin/env bash
set -Eeuo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

docker compose -f docker/compose.yaml down -v --remove-orphans

if docker inspect redmine-5.1.2 >/dev/null 2>&1; then
  docker rm -fv redmine-5.1.2 >/dev/null 2>&1 || true
fi

for volume in redmine-files redmine-log redmine-tmp redmine-db; do
  if docker volume inspect "$volume" >/dev/null 2>&1; then
    docker volume rm "$volume" >/dev/null 2>&1 || true
  fi
done

echo "已重置 Redmine 5.1.2 容器及数据卷。"
