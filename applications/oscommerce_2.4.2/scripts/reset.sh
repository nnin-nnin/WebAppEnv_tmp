#!/usr/bin/env bash
set -Eeuo pipefail

if [[ "${1:-}" != "--yes" ]]; then
  echo "此操作会删除指定容器及其命名数据卷。确认后执行：$0 --yes [CONTAINER]" >&2
  exit 2
fi

container="${2:-oscommerce-242}"
if docker inspect "$container" >/dev/null 2>&1; then
  docker rm -f "$container" >/dev/null
fi

for volume in oscommerce-db oscommerce-work; do
  if docker volume inspect "$volume" >/dev/null 2>&1; then
    docker volume rm "$volume" >/dev/null
  fi
done

echo "已重置 $container 及其命名数据卷；请重新执行 README 中的 docker run。"
