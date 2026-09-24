#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${REDMINE_URL:-http://127.0.0.1:18511}"
username="${REDMINE_USERNAME:-admin}"
: "${REDMINE_PASSWORD:?请通过受控环境变量 REDMINE_PASSWORD 提供密码}"
work_dir=$(mktemp -d)
trap 'rm -rf "$work_dir"' EXIT

login_page=$(curl -fsS -c "$work_dir/cookies" "$base_url/login")
token=$(printf '%s' "$login_page" | sed -n 's/.*name="authenticity_token" value="\([^"]*\)".*/\1/p' | head -n 1)
[[ -n "$token" ]] || { echo '无法从登录页取得 CSRF token' >&2; exit 1; }

curl -fsS -L -c "$work_dir/cookies" -b "$work_dir/cookies" \
  --data-urlencode "authenticity_token=$token" \
  --data-urlencode "username=$username" \
  --data-urlencode "password=$REDMINE_PASSWORD" \
  --data-urlencode 'login=Login' \
  -o "$work_dir/result" "$base_url/login"

if grep -Eiq 'Invalid user or password|Invalid username or password|登录失败' "$work_dir/result"; then
  echo 'Redmine 登录失败' >&2
  exit 1
fi
if ! grep -Eiq 'My page|Administration|登出|Logout|Sign out' "$work_dir/result"; then
  echo 'Redmine 登录未得到成功页面' >&2
  exit 1
fi
echo "Redmine 登录成功：$username"
