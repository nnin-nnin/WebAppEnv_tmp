#!/usr/bin/env bash
set -Eeuo pipefail

BASE_URL="${ERPNEXT_URL:-http://127.0.0.1:18822}"
USERNAME="${ADMIN_USER:-${ADMIN_USERNAME:-${USERNAME:-Administrator}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT
cookiejar="$workdir/cookies.txt"
result="$workdir/result.json"

# 1. Submit credentials to /api/method/login
http_code=$(curl -sS -c "$cookiejar" \
  -H "Accept: application/json" \
  --data-urlencode "usr=$USERNAME" \
  --data-urlencode "pwd=$PASSWORD" \
  -o "$result" -w '%{http_code}' "$BASE_URL/api/method/login")

if [[ "$http_code" != "200" ]]; then
  echo "ERPNext 登录接口返回异常 HTTP 状态码: $http_code" >&2
  cat "$result" >&2 || true
  exit 1
fi

# Check for "Logged In" in response
if ! grep -Eiq '"message":"Logged In"' "$result"; then
  echo "ERPNext 登录失败: 凭据无效或被拒绝" >&2
  cat "$result" >&2 || true
  exit 1
fi

# 2. Verify active session via /api/method/frappe.auth.get_logged_user
current_resp=$(curl -fsS -b "$cookiejar" -H "Accept: application/json" "$BASE_URL/api/method/frappe.auth.get_logged_user")
if ! printf '%s' "$current_resp" | grep -Eiq "\"message\":\"$USERNAME\""; then
  echo "ERPNext 会话校验失败，未检测到当前管理员 $USERNAME" >&2
  echo "$current_resp" >&2
  exit 1
fi

echo "ERPNext 管理员登录成功: $USERNAME (HTTP $http_code)"
