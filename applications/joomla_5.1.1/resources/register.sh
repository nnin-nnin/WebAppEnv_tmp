#!/usr/bin/env bash
set -Eeuo pipefail
container="${JOOMLA_CONTAINER:-joomla-5-1-1}"
username="${1:-}"
password="${2:-}"
email="${3:-${username}@example.local}"
name="${4:-$username}"
if [[ -z "$username" || -z "$password" ]]; then
  echo "用法：JOOMLA_CONTAINER=容器名 $0 用户名 密码 [邮箱] [姓名]" >&2
  exit 2
fi
docker exec "$container" php /var/www/html/cli/joomla.php user:add --username="$username" --name="$name" --email="$email" --password="$password" --usergroup=Registered
echo "已通过 Joomla 官方 CLI 创建 Registered 用户：$username"
