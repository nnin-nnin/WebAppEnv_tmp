#!/usr/bin/env bash
set -Eeuo pipefail

# 同时支持两种执行位置：
#   容器内（镜像 HEALTHCHECK 或 docker exec）：默认 http://127.0.0.1:80，并附加检查 MariaDB；
#   宿主机：设置 JOOMLA_URL=http://127.0.0.1:18211 后只做 HTTP 层检查。

if [ -f /.dockerenv ] || [ "${IN_CONTAINER:-0}" = "1" ]; then
  DEFAULT_PORT=80
else
  DEFAULT_PORT=18211
fi
BASE_URL="${JOOMLA_URL:-http://127.0.0.1:${DEFAULT_PORT}}"

body=$(mktemp)
trap 'rm -f "$body"' EXIT

status=$(curl -sS -o "$body" -w '%{http_code}' --max-time "${JOOMLA_TIMEOUT:-10}" "$BASE_URL/")
[ "$status" = 200 ] || { echo "Joomla HTTP 状态: $status" >&2; exit 1; }
grep -Eqi 'joomla|/media/templates|com_content' "$body" \
  || { echo 'Joomla 应用标记缺失，返回的不是真实站点页面' >&2; exit 1; }

if command -v mariadb-admin >/dev/null 2>&1 && [ -S /run/mysqld/mysqld.sock ]; then
  mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null \
    || { echo 'MariaDB 未就绪' >&2; exit 1; }
  echo "Joomla 健康检查通过（容器内）: $BASE_URL (HTTP $status)"
else
  echo "Joomla 健康检查通过（HTTP 层）: $BASE_URL (HTTP $status)"
fi
