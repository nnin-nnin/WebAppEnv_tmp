#!/usr/bin/env bash
set -Eeuo pipefail

base="${WORDPRESS_URL:-http://127.0.0.1:18513}"
user="${WORDPRESS_USER:-admin}"
if [[ -z "${WORDPRESS_PASSWORD:-}" ]]; then
  echo '请通过受控环境变量 WORDPRESS_PASSWORD 提供密码' >&2
  exit 2
fi
cookie="$(mktemp)"
body="$(mktemp)"
trap 'rm -f "$cookie" "$body"' EXIT
curl --max-time 15 -fsS -c "$cookie" "$base/wp-login.php" >/dev/null
code="$(curl --max-time 15 -sS -L -o "$body" -w '%{http_code}' -b "$cookie" -c "$cookie" \
  --data-urlencode "log=$user" \
  --data-urlencode "pwd=$WORDPRESS_PASSWORD" \
  --data-urlencode 'wp-submit=Log In' \
  --data-urlencode "redirect_to=$base/wp-admin/" \
  --data-urlencode 'testcookie=1' "$base/wp-login.php")"
if [[ "$code" == 2* ]] && grep -Eiq 'Dashboard|wp-admin-bar|Welcome to WordPress' "$body"; then
  echo "WordPress 登录成功：$user"
else
  echo "WordPress 登录失败（HTTP $code）" >&2
  exit 1
fi

