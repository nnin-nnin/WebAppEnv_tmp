#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${RUOYI_BASE_URL:-http://127.0.0.1:18087}"
html="$(curl --fail --silent --show-error --max-time 10 "$base_url/")"
if ! grep -Fq '<div id="app"' <<<"$html"; then
  echo "应用根路径没有返回真实前端入口" >&2
  exit 1
fi

if [[ "$(curl --fail --silent --show-error --max-time 10 "$base_url/healthz")" != "ok" ]]; then
  echo "Nginx 健康端点没有返回 ok" >&2
  exit 1
fi

backend_probe="$(curl --fail --silent --show-error --max-time 10 \
  --get --data-urlencode 'name=芋道源码' \
  "$base_url/admin-api/system/tenant/get-id-by-name")"
if ! jq -e '.code == 0 and (.data | tostring | length > 0)' <<<"$backend_probe" >/dev/null; then
  echo "Spring Boot 后端探测失败: $backend_probe" >&2
  exit 1
fi

if [[ "${IN_CONTAINER:-0}" == "1" ]]; then
  mysqladmin --protocol=TCP --host=127.0.0.1 --user=root --password="${MYSQL_ROOT_PASSWORD:-123456}" ping --silent
  [[ "$(redis-cli -h 127.0.0.1 ping)" == "PONG" ]]
fi

echo "健康检查成功：$base_url"
