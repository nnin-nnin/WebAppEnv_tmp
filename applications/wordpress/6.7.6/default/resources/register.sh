#!/usr/bin/env bash
set -Eeuo pipefail

container="${WORDPRESS_CONTAINER:-wordpress-6-5-3}"
username="${1:-}"
password="${2:-}"
email="${3:-}"
name="${4:-$username}"
if [[ -z "$username" || -z "$password" || -z "$email" ]]; then
  echo "用法：WORDPRESS_CONTAINER=容器名 $0 用户名 密码 邮箱 [显示名称]" >&2
  exit 2
fi
docker exec "$container" php /usr/local/bin/wordpress-user-create.php "$username" "$password" "$email" "$name"

