#!/usr/bin/env bash
set -Eeuo pipefail

api_url="${MEDIAWIKI_API_URL:-http://127.0.0.1:18519/api.php}"
username="${MEDIAWIKI_USERNAME:-admin}"
password="${MEDIAWIKI_PASSWORD:-${MEDIAWIKI_ADMIN_PASSWORD:-}}"
if [[ -z "$password" ]]; then
  echo '请通过受控环境变量 MEDIAWIKI_PASSWORD 或 MEDIAWIKI_ADMIN_PASSWORD 提供登录密码。' >&2
  exit 2
fi

cookie=$(mktemp)
response=$(mktemp)
trap 'rm -f "$cookie" "$response"' EXIT

curl --fail --silent --show-error --max-time 15 \
  --cookie-jar "$cookie" \
  --data-urlencode 'action=query' --data-urlencode 'meta=tokens' \
  --data-urlencode 'type=login' --data-urlencode 'format=json' \
  "$api_url" > "$response"
login_token=$(sed -n 's/.*"logintoken":"\([^"]*\)".*/\1/p' "$response")
login_token=$(printf '%s' "$login_token" | sed 's/\\\\/\\/g')
if [[ -z "$login_token" ]]; then
  echo '未获取到 MediaWiki 登录令牌。' >&2
  exit 1
fi

curl --fail --silent --show-error --max-time 15 \
  --cookie "$cookie" --cookie-jar "$cookie" \
  --data-urlencode 'action=clientlogin' --data-urlencode "username=$username" \
  --data-urlencode "password=$password" --data-urlencode "logintoken=$login_token" \
  --data-urlencode 'loginreturnurl=http://localhost/' \
  --data-urlencode 'format=json' "$api_url" > "$response"
if ! grep -q '"status":"PASS"' "$response"; then
  echo 'MediaWiki 登录失败。' >&2
  exit 1
fi
echo "MediaWiki 登录成功: $username"
