#!/usr/bin/env bash
set -Eeuo pipefail

if [[ $# -lt 1 || $# -gt 3 ]]; then
  echo "用法：HOTCRP_BASE_URL=... $0 user@example.com [First] [Last]" >&2
  exit 2
fi
new_email="$1"
first_name="${2:-Benchmark}"
last_name="${3:-User}"
if [[ "$new_email" != *@*.* ]]; then
  echo "注册失败：需要有效的邮箱形式，例如 user@example.com" >&2
  exit 2
fi

base_url="${HOTCRP_BASE_URL:-http://127.0.0.1:18403}"
admin_email="${HOTCRP_LOGIN_EMAIL:-admin@hotcrp.local}"
admin_password="${HOTCRP_LOGIN_PASSWORD:-benchmark-only}"
cookie_file="$(mktemp)"
signin_page="$(mktemp)"
session_json="$(mktemp)"
bulk_page="$(mktemp)"
result_page="$(mktemp)"
trap 'rm -f "$cookie_file" "$signin_page" "$session_json" "$bulk_page" "$result_page"' EXIT

curl --fail --silent --show-error --max-time 20 \
  --cookie-jar "$cookie_file" "$base_url/signin" -o "$signin_page"
curl --fail --silent --show-error --max-time 20 \
  --cookie "$cookie_file" --cookie-jar "$cookie_file" \
  "$base_url/api/session" -o "$session_json"
post_token="$(sed -n 's/.*"postvalue": "\([^"]*\)".*/\1/p' "$session_json" | head -n 1)"
if [[ -z "$post_token" ]]; then
  echo "创建用户失败：未能建立 HotCRP 会话" >&2
  exit 1
fi
curl --fail --silent --show-error --max-time 20 \
  --cookie "$cookie_file" --cookie-jar "$cookie_file" --location \
  --data-urlencode "email=$admin_email" \
  --data-urlencode "password=$admin_password" \
  --data-urlencode "post=$post_token" \
  --data-urlencode "signin=Sign in" \
  "$base_url/signin.php" -o "$result_page"
if ! grep -Fq 'Sign out' "$result_page"; then
  echo "创建用户失败：管理员登录未成功" >&2
  exit 1
fi

curl --fail --silent --show-error --max-time 20 \
  --cookie "$cookie_file" "$base_url/profile.php/bulk" -o "$bulk_page"
post_token="$(sed -n 's/.*action="[^"]*post=\([^"]*\)".*/\1/p' "$bulk_page" | head -n 1)"
if [[ -z "$post_token" ]]; then
  echo "创建用户失败：未找到 HotCRP 用户批量表单令牌" >&2
  exit 1
fi
csv="email,firstName,lastName
$new_email,$first_name,$last_name"
curl --fail --silent --show-error --max-time 20 \
  --cookie "$cookie_file" --cookie-jar "$cookie_file" --location \
  --data-urlencode "post=$post_token" \
  --data-urlencode "bulkentry=$csv" \
  --data-urlencode "savebulk=1" \
  "$base_url/profile.php/bulk" -o "$result_page"

if ! grep -Fqi "$new_email" "$result_page"; then
  echo "创建用户失败：HotCRP 未返回新用户 $new_email" >&2
  exit 1
fi
echo "普通用户创建成功：$new_email（HotCRP 用户批量管理入口）"
