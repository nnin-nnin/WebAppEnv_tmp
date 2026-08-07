#!/usr/bin/env bash
set -Eeuo pipefail

base_url=${MINTHCM_URL:-http://127.0.0.1:18520}
base_url=${base_url%/}
username=${MINTHCM_USER:-admin}
password=${MINTHCM_PASSWORD:-${MINTHCM_ADMIN_PASSWORD:-}}
if [ -z "${password}" ]; then
    echo '请通过受控环境变量 MINTHCM_PASSWORD 或 MINTHCM_ADMIN_PASSWORD 提供凭据。' >&2
    exit 2
fi

cookie=$(mktemp)
response=$(mktemp)
trap 'rm -f "$cookie" "$response"' EXIT

json_escape() {
    printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'
}
user_json=$(json_escape "$username")
pass_json=$(json_escape "$password")
payload=$(printf '{"username":"%s","password":"%s","login_language":"en_us"}' "$user_json" "$pass_json")
status=$(curl --silent --show-error --max-time "${MINTHCM_LOGIN_TIMEOUT:-20}" \
    -c "$cookie" -b "$cookie" -H 'Content-Type: application/json' \
    -d "$payload" -o "$response" -w '%{http_code}' "$base_url/api/login")

if [ "$status" != 200 ] || ! grep -Eq 'Login success' "$response"; then
    echo "MintHCM 登录失败（HTTP ${status}）。" >&2
    exit 1
fi
printf 'MintHCM 登录成功：%s（会话已写入临时 cookie）。\n' "$username"
