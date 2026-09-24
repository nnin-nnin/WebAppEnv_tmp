#!/usr/bin/env bash
set -Eeuo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

docker compose -f docker/compose.yaml up -d

for i in {1..40}; do
  if bash scripts/healthcheck.sh >/dev/null 2>&1; then
    admin_pass="WcOpen!26-hV4qM7D"
    if [ -f "resources/users.yaml" ]; then
      p="$(grep 'password:' "resources/users.yaml" | head -n 1 | awk '{print $2}' | tr -d '"\r\n')"
      if [ -n "$p" ]; then
        admin_pass="$p"
      fi
    fi
    container_id="$(docker compose -f docker/compose.yaml ps -q application 2>/dev/null || true)"
    if [ -n "$container_id" ]; then
      docker exec "$container_id" mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot -D opencart -e "UPDATE oc_user SET password = MD5('$admin_pass') WHERE username = 'admin';" >/dev/null 2>&1 || true
    fi
    echo "OpenCart 4.0.2-3 服务已成功启动并通过健康检查。"
    exit 0
  fi
  sleep 2
done

echo "OpenCart 4.0.2-3 启动超时。" >&2
exit 1
