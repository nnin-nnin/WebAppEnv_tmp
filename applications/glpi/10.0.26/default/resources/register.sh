#!/usr/bin/env bash
set -Eeuo pipefail

if [[ "$#" -lt 1 || "$#" -gt 2 ]]; then
    echo "用法：GLPI_PASSWORD=... GLPI_NEW_PASSWORD=... $0 用户名 [邮箱]" >&2
    exit 2
fi
username="$1"
email="${2:-${username}@localhost}"
if [[ ! "$username" =~ ^[A-Za-z0-9._-]{1,80}$ || ! "$email" =~ ^[^[:space:]\"]+@[^[:space:]\"]+$ ]]; then
    echo '用户名或邮箱格式不符合要求' >&2
    exit 2
fi
: "${GLPI_PASSWORD:?请通过受控环境变量 GLPI_PASSWORD 提供管理员密码}"
: "${GLPI_NEW_PASSWORD:?请通过受控环境变量 GLPI_NEW_PASSWORD 提供新用户密码}"
if [[ ! "$GLPI_NEW_PASSWORD" =~ ^[A-Za-z0-9@#%+_=-]{8,128}$ ]]; then
    echo 'GLPI_NEW_PASSWORD 必须为 8-128 个安全字符（不含引号和反斜杠）' >&2
    exit 2
fi

base_url="${GLPI_URL:-http://127.0.0.1:18514}"
api_url="${GLPI_API_URL:-${base_url%/}/apirest.php}"
tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

login_status="$(curl --silent --show-error --max-time 15 --output "$tmp_dir/login" \
    --write-out '%{http_code}' --request GET --user "admin:$GLPI_PASSWORD" \
    --header 'Content-Type: application/json' "$api_url/initSession")"
if [[ "$login_status" != 2* ]]; then
    echo "管理员认证失败（HTTP $login_status）" >&2
    exit 1
fi
session_token="$(grep -Eo '"session_token"[[:space:]]*:[[:space:]]*"[^"]+"' "$tmp_dir/login" | sed -E 's/.*"([^"]+)"$/\1/' | head -n 1)"
[[ -n "$session_token" ]] || { echo '管理员认证响应缺少 session_token' >&2; exit 1; }

payload="$(printf '{"input":{"name":"%s","realname":"%s","email":"%s","password":"%s","password2":"%s","entities_id":0,"_entities_id":0,"_profiles_id":1,"is_active":1}}' "$username" "$username" "$email" "$GLPI_NEW_PASSWORD" "$GLPI_NEW_PASSWORD")"
status="$(curl --silent --show-error --max-time 15 --output "$tmp_dir/create" \
    --write-out '%{http_code}' --request POST "$api_url/User" \
    --header 'Content-Type: application/json' --header "Session-Token: $session_token" \
    --data "$payload")"
if [[ "$status" != 2* ]] || ! grep -Eq '"id"[[:space:]]*:[[:space:]]*[0-9]+' "$tmp_dir/create"; then
    echo "GLPI 用户创建失败（HTTP $status）" >&2
    exit 1
fi
echo "GLPI 普通用户创建成功：$username"

