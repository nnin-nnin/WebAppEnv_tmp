#!/bin/bash
set -Eeuo pipefail
if [ "$#" -ne 2 ]; then echo "用法: $0 用户名 密码" >&2; exit 2; fi
BASE_URL="${ESPOCRM_URL:-http://127.0.0.1:18292}"
ADMIN_USER="${ESPOCRM_ADMIN_USER:-admin}"
ADMIN_PASSWORD="${ESPOCRM_ADMIN_PASSWORD:-benchmark-only}"
auth=$(printf '%s:%s' "$ADMIN_USER" "$ADMIN_PASSWORD" | base64 -w0)
response=$(mktemp)
trap 'rm -f "$response"' EXIT
payload=$(printf '{"userName":"%s","password":"%s","isActive":true}' "$1" "$2")
status=$(curl -sS -o "$response" -w '%{http_code}' -X POST \
  -H "Authorization: Basic $auth" -H "Espo-Authorization: $auth" -H 'Content-Type: application/json' \
  -d "$payload" "$BASE_URL/api/v1/User")
if [[ "$status" != 200 && "$status" != 201 ]]; then echo "创建用户失败 (HTTP $status): $(cat "$response")" >&2; exit 1; fi
echo "普通用户创建成功: $1"
