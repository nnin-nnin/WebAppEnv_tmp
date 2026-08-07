#!/usr/bin/env bash
set -Eeuo pipefail
if [[ -z "${WORDPRESS_CONTAINER:-}" ]]; then
  echo '请设置 WORDPRESS_CONTAINER 为正在运行的容器名或 ID' >&2
  exit 2
fi
docker exec "$WORDPRESS_CONTAINER" /usr/local/bin/wordpress-reset
docker restart "$WORDPRESS_CONTAINER" >/dev/null
echo "已重置 WordPress 数据库；容器重启后恢复初始站点和 admin 账号。"

