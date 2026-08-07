#!/bin/bash
set -Eeuo pipefail

if [ "$#" -ne 2 ]; then
  echo "用法: $0 用户名 密码" >&2
  exit 2
fi
BASE_URL="${ITOP_URL:-http://127.0.0.1:18515}"
if [ -z "${ITOP_PASSWORD:-}" ]; then
  echo '请通过受控环境变量 ITOP_PASSWORD 提供管理员凭据。' >&2
  exit 2
fi

escape_json() { printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'; }
user_json=$(escape_json "$1")
password_json=$(escape_json "$2")
json=$(printf '{"operation":"core/create","class":"UserLocal","comment":"all-in-one acceptance","output_fields":"id,login","fields":{"login":"%s","password":"%s","status":"enabled","profile_list":[{"profileid":4}]}}' "$user_json" "$password_json")
response=$(mktemp)
trap 'rm -f "$response"' EXIT
status=$(curl -fsS -o "$response" -w '%{http_code}' -X POST \
  --data-urlencode 'version=1.0' --data-urlencode "auth_user=${ITOP_USER:-admin}" \
  --data-urlencode "auth_pwd=$ITOP_PASSWORD" --data-urlencode "json_data=$json" \
  "$BASE_URL/webservices/rest.php") || {
  echo "创建用户请求失败 (HTTP $status)" >&2
  exit 1
}
if [ "$status" != 200 ] || ! grep -Eiq '"code"[[:space:]]*:[[:space:]]*0|"login"' "$response"; then
  echo "iTop 创建普通用户失败 (HTTP $status)" >&2
  exit 1
fi
echo "iTop 普通用户创建成功: $1"
