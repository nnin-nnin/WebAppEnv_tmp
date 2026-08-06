#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${HOTCRP_BASE_URL:-http://127.0.0.1:18403}"
email="${HOTCRP_LOGIN_EMAIL:-admin@hotcrp.local}"
password="${HOTCRP_LOGIN_PASSWORD:-benchmark-only}"
cookie_file="$(mktemp)"
signin_page="$(mktemp)"
session_json="$(mktemp)"
result_page="$(mktemp)"
trap 'rm -f "$cookie_file" "$signin_page" "$session_json" "$result_page"' EXIT

curl --fail --silent --show-error --max-time 20 \
  --cookie-jar "$cookie_file" "$base_url/signin" -o "$signin_page"
curl --fail --silent --show-error --max-time 20 \
  --cookie "$cookie_file" --cookie-jar "$cookie_file" \
  "$base_url/api/session" -o "$session_json"
post_token="$(sed -n 's/.*"postvalue": "\([^"]*\)".*/\1/p' "$session_json" | head -n 1)"
if [[ -z "$post_token" ]]; then
  echo "登录失败：未能建立 HotCRP 会话" >&2
  exit 1
fi

curl --fail --silent --show-error --max-time 20 \
  --cookie "$cookie_file" --cookie-jar "$cookie_file" \
  --location \
  --data-urlencode "email=$email" \
  --data-urlencode "password=$password" \
  --data-urlencode "post=$post_token" \
  --data-urlencode "signin=Sign in" \
  "$base_url/signin.php" -o "$result_page"

if ! grep -Fq 'Sign out' "$result_page"; then
  echo "登录失败：HotCRP 未返回已登录页面（账号：$email）" >&2
  exit 1
fi
echo "登录成功：$email"
