#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${GLPI_URL:-http://127.0.0.1:18514}"
api_url="${GLPI_API_URL:-${base_url%/}/apirest.php}"
username="${GLPI_USERNAME:-admin}"
: "${GLPI_PASSWORD:?请通过受控环境变量 GLPI_PASSWORD 提供密码}"

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT
status="$(curl --silent --show-error --max-time 15 --output "$tmp_dir/body" \
    --write-out '%{http_code}' --request GET \
    --user "$username:$GLPI_PASSWORD" \
    --header 'Content-Type: application/json' "$api_url/initSession")"
if [[ "$status" != 2* ]]; then
    echo "GLPI 登录失败（HTTP $status）" >&2
    exit 1
fi

session_token="$(grep -Eo '"session_token"[[:space:]]*:[[:space:]]*"[^"]+"' "$tmp_dir/body" | sed -E 's/.*"([^"]+)"$/\1/' | head -n 1)"
if [[ -z "$session_token" ]]; then
    echo 'GLPI 登录失败：响应中没有 session_token' >&2
    exit 1
fi
echo "GLPI 登录成功，session_token=$session_token"

