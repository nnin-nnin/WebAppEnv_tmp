#!/usr/bin/env bash
set -Eeuo pipefail

if [ "$#" -lt 3 ] || [ "$#" -gt 4 ]; then
    echo '用法：MINTHCM_ADMIN_PASSWORD=受控值 resources/register.sh 用户名 密码 邮箱 [姓氏]' >&2
    exit 2
fi
new_user=$1
new_password=$2
email=$3
last_name=${4:-MintHCM User}
admin_user=${MINTHCM_ADMIN_USER:-admin}
admin_password=${MINTHCM_ADMIN_PASSWORD:-${MINTHCM_PASSWORD:-}}
base_url=${MINTHCM_URL:-http://127.0.0.1:18520}
base_url=${base_url%/}
if [ -z "$admin_password" ]; then
    echo '请通过受控环境变量 MINTHCM_ADMIN_PASSWORD 提供管理员凭据。' >&2
    exit 2
fi

cookie=$(mktemp)
response=$(mktemp)
new_cookie=$(mktemp)
new_response=$(mktemp)
trap 'rm -f "$cookie" "$response" "$new_cookie" "$new_response"' EXIT

json_escape() {
    printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'
}
admin_json=$(json_escape "$admin_user")
admin_pass_json=$(json_escape "$admin_password")
login_payload=$(printf '{"username":"%s","password":"%s","login_language":"en_us"}' "$admin_json" "$admin_pass_json")
login_status=$(curl --silent --show-error --max-time 20 \
    -c "$cookie" -b "$cookie" -H 'Content-Type: application/json' \
    -d "$login_payload" -o "$response" -w '%{http_code}' "$base_url/api/login")
if [ "$login_status" != 200 ] || ! grep -Eq 'Login success' "$response"; then
    echo "管理员登录失败（HTTP ${login_status}）。" >&2
    exit 1
fi

save_status=$(curl --silent --show-error --location --max-time 30 \
    -c "$cookie" -b "$cookie" \
    --data-urlencode "module=Users" \
    --data-urlencode "action=Save" \
    --data-urlencode "user_name=${new_user}" \
    --data-urlencode "first_name=MintHCM" \
    --data-urlencode "last_name=${last_name}" \
    --data-urlencode "status=Active" \
    --data-urlencode "email1=${email}" \
    --data-urlencode "new_password=${new_password}" \
    --data-urlencode "confirm_new_password=${new_password}" \
    --data-urlencode 'is_admin=0' \
    --data-urlencode 'is_group=0' \
    --data-urlencode 'portal_only=0' \
    -o "$response" -w '%{http_code}' "$base_url/index.php?module=Users&action=Save")
if [ "$save_status" -lt 200 ] || [ "$save_status" -ge 400 ]; then
    echo "普通用户创建请求失败（HTTP ${save_status}）。" >&2
    exit 1
fi

user_json=$(json_escape "$new_user")
pass_json=$(json_escape "$new_password")
new_payload=$(printf '{"username":"%s","password":"%s","login_language":"en_us"}' "$user_json" "$pass_json")
new_status=$(curl --silent --show-error --max-time 20 \
    -c "$new_cookie" -b "$new_cookie" -H 'Content-Type: application/json' \
    -d "$new_payload" -o "$new_response" -w '%{http_code}' "$base_url/api/login")
if [ "$new_status" != 200 ] || ! grep -Eq 'Login success' "$new_response"; then
    echo '普通用户创建后登录验收失败。' >&2
    exit 1
fi
printf 'MintHCM 普通用户创建并登录验收成功：%s。\n' "$new_user"
