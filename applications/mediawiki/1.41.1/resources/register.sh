#!/usr/bin/env bash
set -Eeuo pipefail

api_url="${MEDIAWIKI_API_URL:-http://127.0.0.1:18519/api.php}"
admin_username="${MEDIAWIKI_USERNAME:-admin}"
admin_password="${MEDIAWIKI_ADMIN_PASSWORD:-}"
new_username="${1:-}"
new_password="${2:-}"

if [[ -z "$admin_password" || -z "$new_username" || -z "$new_password" ]]; then
  echo '用法: MEDIAWIKI_ADMIN_PASSWORD=受控密码 resources/register.sh 用户名 新密码' >&2
  exit 2
fi
if [[ ${#new_password} -lt 8 ]]; then
  echo '新密码至少需要 8 个字符。' >&2
  exit 2
fi

cookie=$(mktemp)
response=$(mktemp)
trap 'rm -f "$cookie" "$response"' EXIT

curl --fail --silent --show-error --max-time 15 --cookie-jar "$cookie" \
  --data-urlencode 'action=query' --data-urlencode 'meta=tokens' \
  --data-urlencode 'type=login' --data-urlencode 'format=json' "$api_url" > "$response"
login_token=$(sed -n 's/.*"logintoken":"\([^"]*\)".*/\1/p' "$response")
login_token=$(printf '%s' "$login_token" | sed 's/\\\\/\\/g')
if [[ -z "$login_token" ]]; then
  echo '未获取到 MediaWiki 登录令牌。' >&2
  exit 1
fi
curl --fail --silent --show-error --max-time 15 --cookie "$cookie" --cookie-jar "$cookie" \
  --data-urlencode 'action=clientlogin' --data-urlencode "username=$admin_username" \
  --data-urlencode "password=$admin_password" --data-urlencode "logintoken=$login_token" \
  --data-urlencode 'loginreturnurl=http://localhost/' \
  --data-urlencode 'format=json' "$api_url" > "$response"
if ! grep -q '"status":"PASS"' "$response"; then
  echo '管理员登录失败，未创建用户。' >&2
  exit 1
fi

curl --fail --silent --show-error --max-time 15 --cookie "$cookie" --cookie-jar "$cookie" \
  --data-urlencode 'action=query' --data-urlencode 'meta=tokens' \
  --data-urlencode 'type=createaccount' --data-urlencode 'format=json' "$api_url" > "$response"
create_token=$(sed -n 's/.*"createaccounttoken":"\([^"]*\)".*/\1/p' "$response")
create_token=$(printf '%s' "$create_token" | sed 's/\\\\/\\/g')
if [[ -z "$create_token" ]]; then
  echo '未获取到 MediaWiki 创建用户令牌。' >&2
  exit 1
fi

curl --fail --silent --show-error --max-time 15 --cookie "$cookie" \
  --data-urlencode 'action=createaccount' --data-urlencode "username=$new_username" \
  --data-urlencode "password=$new_password" \
  --data-urlencode "retype=$new_password" --data-urlencode 'createreturnurl=http://localhost/' \
  --data-urlencode "createtoken=$create_token" --data-urlencode 'format=json' "$api_url" > "$response"
if ! grep -q '"status":"PASS"\|"result":"Success"' "$response"; then
  echo 'MediaWiki 创建用户失败。' >&2
  exit 1
fi
echo "MediaWiki 普通用户创建成功: $new_username"
