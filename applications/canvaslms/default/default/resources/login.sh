#!/usr/bin/env bash
set -Eeuo pipefail

BASE_URL="${CANVAS_URL:-http://127.0.0.1:18805}"
USERNAME="${ADMIN_USER:-${ADMIN_USERNAME:-${USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT
cookiejar="$workdir/cookies.txt"
result="$workdir/result.html"

login_page=$(curl -fsS -L -c "$cookiejar" "$BASE_URL/login/canvas")
token=$(printf '%s' "$login_page" | sed -n 's/.*name="authenticity_token" value="\([^"]*\)".*/\1/p' | head -n 1)
if [[ -z "$token" ]]; then
  echo '无法从登录页取得 CSRF token' >&2
  exit 1
fi

http_code=$(curl -sS -L -c "$cookiejar" -b "$cookiejar" \
  --data-urlencode "authenticity_token=$token" \
  --data-urlencode "pseudonym_session[unique_id]=$USERNAME" \
  --data-urlencode "pseudonym_session[password]=$PASSWORD" \
  --data-urlencode "redirect_to_ssl=0" \
  -o "$result" -w '%{http_code}' "$BASE_URL/login/canvas")

if [[ "$http_code" != "200" ]]; then
  echo "Canvas LMS 登录返回状态码异常: HTTP $http_code" >&2
  exit 1
fi

if grep -Eiq 'Invalid username or password|Invalid login|failed' "$result" && ! grep -Eiq 'Dashboard|Courses|Account|login_success' "$result"; then
  echo 'Canvas LMS 登录失败: 凭据无效' >&2
  exit 1
fi

if ! grep -Eiq 'Dashboard|Courses|Account|login_success|grades' "$result"; then
  echo 'Canvas LMS 登录未检测到成功登录状态' >&2
  exit 1
fi

echo "Canvas LMS 登录成功：$USERNAME (HTTP $http_code)"
