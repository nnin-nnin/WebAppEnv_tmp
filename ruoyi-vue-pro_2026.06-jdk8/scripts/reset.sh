#!/usr/bin/env bash
set -Eeuo pipefail

container_name="${RUOYI_CONTAINER_NAME:-ruoyi-vue-pro}"
confirm="${1:-}"

if [[ "$confirm" != "--yes" ]]; then
  echo "此操作会删除容器及其 MySQL/Redis 数据卷。确认后执行：$0 --yes" >&2
  exit 2
fi

if ! docker container inspect "$container_name" >/dev/null 2>&1; then
  echo "容器不存在：$container_name"
  exit 0
fi

volume_names="$(docker inspect --format '{{range .Mounts}}{{if or (eq .Destination "/var/lib/mysql") (eq .Destination "/var/lib/redis")}}{{.Name}} {{end}}{{end}}' "$container_name")"
docker rm --force "$container_name" >/dev/null
for volume_name in $volume_names; do
  [[ -n "$volume_name" ]] && docker volume rm "$volume_name" >/dev/null || true
done

echo "已重置容器和持久化数据：$container_name"
