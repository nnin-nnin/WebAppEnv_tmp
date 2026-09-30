#!/usr/bin/env bash
set -Eeuo pipefail

BASE_URL="${DISCOURSE_URL:-http://127.0.0.1:18816}"
USERNAME="${ADMIN_USER:-${ADMIN_USERNAME:-${USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT
cookiejar="$workdir/cookies.txt"
result="$workdir/result.json"

# 1. Fetch CSRF token
csrf_resp=$(curl -fsS -c "$cookiejar" -H "Accept: application/json" "$BASE_URL/session/csrf")
token=$(printf '%s' "$csrf_resp" | grep -o '"csrf":"[^"]*"' | cut -d'"' -f4 || true)

if [[ -z "$token" ]]; then
  echo "无法从 /session/csrf 取得 CSRF token" >&2
  exit 1
fi

# 2. Submit credentials to /session
http_code=$(curl -sS -c "$cookiejar" -b "$cookiejar" \
  -H "X-CSRF-Token: $token" \
  -H "Accept: application/json" \
  --data-urlencode "login=$USERNAME" \
  --data-urlencode "password=$PASSWORD" \
  -o "$result" -w '%{http_code}' "$BASE_URL/session")

if [[ "$http_code" != "200" ]]; then
  echo "Discourse 登录接口返回异常 HTTP 状态码: $http_code" >&2
  cat "$result" >&2 || true
  exit 1
fi

# Check for error in response
if grep -Eiq '"error"' "$result"; then
  echo "Discourse 登录失败: 凭据无效或被拒绝" >&2
  cat "$result" >&2 || true
  exit 1
fi

# 3. Verify session via /session/current.json
current_resp=$(curl -fsS -b "$cookiejar" -H "Accept: application/json" "$BASE_URL/session/current.json")
if ! printf '%s' "$current_resp" | grep -Eiq "\"username\":\"$USERNAME\""; then
  echo "Discourse 会话校验失败，未检测到当前管理员 $USERNAME" >&2
  echo "$current_resp" >&2
  exit 1
fi

echo "Discourse 管理员登录成功: $USERNAME (HTTP $http_code)"
