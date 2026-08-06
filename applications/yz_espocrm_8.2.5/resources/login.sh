#!/bin/bash
set -Eeuo pipefail
BASE_URL="${ESPOCRM_URL:-http://127.0.0.1:18292}"
USER_NAME="${ESPOCRM_USER:-admin}"
PASSWORD="${ESPOCRM_PASSWORD:-benchmark-only}"
auth=$(printf '%s:%s' "$USER_NAME" "$PASSWORD" | base64 -w0)
body=$(mktemp)
status=$(curl -sS -o "$body" -w '%{http_code}' -H "Authorization: Basic $auth" -H "Espo-Authorization: $auth" "$BASE_URL/api/v1/App/user")
if [ "$status" != 200 ]; then echo "登录失败 (HTTP $status): $(cat "$body")" >&2; exit 1; fi
echo "登录成功: $USER_NAME"
rm -f "$body"
