#!/usr/bin/env bash
set -Eeuo pipefail

if [[ $# -lt 3 || $# -gt 4 ]]; then
  echo "用法：REDMINE_PASSWORD=... $0 用户名 邮箱 用户密码 [显示名]" >&2
  exit 2
fi
new_username=$1
new_email=$2
new_password=$3
display_name="${4:-$new_username}"
base_url="${REDMINE_URL:-http://127.0.0.1:18511}"
admin_username="${REDMINE_USERNAME:-admin}"
: "${REDMINE_PASSWORD:?请通过受控环境变量 REDMINE_PASSWORD 提供管理员密码}"

work_dir=$(mktemp -d)
trap 'rm -rf "$work_dir"' EXIT
login_page=$(curl -fsS -c "$work_dir/cookies" "$base_url/login")
token=$(printf '%s' "$login_page" | sed -n 's/.*name="authenticity_token" value="\([^"]*\)".*/\1/p' | head -n 1)
[[ -n "$token" ]] || { echo '无法从登录页取得 CSRF token' >&2; exit 1; }
curl -fsS -L -c "$work_dir/cookies" -b "$work_dir/cookies" \
  --data-urlencode "authenticity_token=$token" \
  --data-urlencode "username=$admin_username" \
  --data-urlencode "password=$REDMINE_PASSWORD" \
  --data-urlencode 'login=Login' \
  -o "$work_dir/admin" "$base_url/login"
grep -Eiq 'My page|Administration|登出|Logout|Sign out' "$work_dir/admin" || { echo '管理员登录失败' >&2; exit 1; }

new_page=$(curl -fsS -b "$work_dir/cookies" "$base_url/users/new")
new_token=$(printf '%s' "$new_page" | sed -n 's/.*name="authenticity_token" value="\([^"]*\)".*/\1/p' | head -n 1)
[[ -n "$new_token" ]] || { echo '无法从用户创建页取得 CSRF token' >&2; exit 1; }

curl -fsS -L -b "$work_dir/cookies" -c "$work_dir/cookies" \
  --data-urlencode "authenticity_token=$new_token" \
  --data-urlencode "user[login]=$new_username" \
  --data-urlencode "user[firstname]=$display_name" \
  --data-urlencode 'user[lastname]=User' \
  --data-urlencode "user[mail]=$new_email" \
  --data-urlencode "user[password]=$new_password" \
  --data-urlencode "user[password_confirmation]=$new_password" \
  --data-urlencode 'user[language]=zh' \
  --data-urlencode 'commit=Create' \
  -o "$work_dir/result" "$base_url/users"

if grep -Eiq 'already exists|已经存在|must be filled|不能为空|is invalid|无效' "$work_dir/result"; then
  echo 'Redmine 用户创建失败，请检查用户名、邮箱或密码要求' >&2
  exit 1
fi
grep -Fq "$new_username" "$work_dir/result" || { echo 'Redmine 用户创建结果未确认' >&2; exit 1; }
echo "Redmine 普通用户创建成功：$new_username"
