#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${GLPI_URL:-http://127.0.0.1:18514}"
base_url="${base_url%/}"
body="$(curl --fail --silent --show-error --location --max-time 10 "$base_url/index.php")"
if ! grep -Eiq 'GLPI|login' <<<"$body"; then
    echo '公开 HTTP 入口未返回 GLPI 登录页面' >&2
    exit 1
fi
echo "GLPI HTTP 健康检查通过：$base_url"

