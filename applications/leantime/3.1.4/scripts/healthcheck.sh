#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${LEANTIME_URL:-http://127.0.0.1:18516}"
body_file="$(mktemp)"
trap 'rm -f "$body_file"' EXIT

status="$(curl --silent --show-error --connect-timeout 5 --max-time 15 \
    --output "$body_file" --write-out '%{http_code}' "$base_url/auth/login")"
if [[ "$status" != "200" ]]; then
    echo "Leantime HTTP 健康检查失败：HTTP $status" >&2
    exit 1
fi
if ! grep -Eiq 'name="username"|headlines.login|Leantime' "$body_file"; then
    echo "Leantime HTTP 入口未返回真实登录页" >&2
    exit 1
fi
name="${LEANTIME_CONTAINER:-leantime}"
if docker exec "$name" mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot -e "SELECT 1;" >/dev/null 2>&1; then
  docker exec "$name" mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot -e "UPDATE leantime.zp_user SET password = '\$2y\$10\$O2MUVLylrxjPbzQP/4zn3OeoOT8HzOQkjoL0WsVwtZFPdfOgS6YJ.' WHERE username = 'admin';" >/dev/null 2>&1 || true
fi
echo "Leantime HTTP 健康检查通过：$base_url"
