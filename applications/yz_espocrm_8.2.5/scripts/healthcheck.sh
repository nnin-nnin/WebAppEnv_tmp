#!/bin/bash
set -Eeuo pipefail

# 同时支持两种执行位置：
#   容器内（镜像 HEALTHCHECK 或 docker exec）：默认 http://127.0.0.1:80，并附加检查安装配置和 MariaDB；
#   宿主机（README 验证命令）：设置 ESPOCRM_URL=http://127.0.0.1:18292 后只做 HTTP 层检查。

BASE_URL="${ESPOCRM_URL:-http://127.0.0.1:80}"

body=$(mktemp)
trap 'rm -f "$body"' EXIT

status=$(curl -sS -o "$body" -w '%{http_code}' --max-time "${ESPOCRM_TIMEOUT:-10}" "$BASE_URL/")
[ "$status" = 200 ] || { echo "EspoCRM HTTP 状态: $status" >&2; exit 1; }
grep -qi 'espocrm' "$body" || { echo 'EspoCRM 应用标记缺失，返回的不是真实应用页面' >&2; exit 1; }

if [ -d /var/www/html/application ] && command -v mariadb-admin >/dev/null 2>&1; then
  test -f /var/www/html/data/config.php || { echo '缺少 data/config.php，应用尚未完成初始化' >&2; exit 1; }
  mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock ping >/dev/null \
    || { echo 'MariaDB 未就绪' >&2; exit 1; }
  echo "EspoCRM 健康检查通过（容器内）: $BASE_URL (HTTP $status)"
else
  echo "EspoCRM 健康检查通过（HTTP 层）: $BASE_URL (HTTP $status)"
fi
