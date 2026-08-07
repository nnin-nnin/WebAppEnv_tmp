#!/usr/bin/env bash
set -Eeuo pipefail

BASE_URL="${OSCOMMERCE_URL:-http://127.0.0.1:18402}"
EMAIL="${1:-${OSCOMMERCE_REGISTER_EMAIL:-}}"
PASSWORD="${2:-${OSCOMMERCE_REGISTER_PASSWORD:-benchmark-customer}}"
FIRST_NAME="${OSCOMMERCE_REGISTER_FIRST_NAME:-Benchmark}"
LAST_NAME="${OSCOMMERCE_REGISTER_LAST_NAME:-Customer}"
BASE_URL="${BASE_URL%/}"

if [[ -z "$EMAIL" || -z "$PASSWORD" ]]; then
  echo "用法：$0 EMAIL PASSWORD" >&2
  exit 2
fi

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

curl_args=(-fsS --max-time "${OSCOMMERCE_TIMEOUT:-20}" -c "$tmp_dir/cookies" -b "$tmp_dir/cookies")
curl "${curl_args[@]}" "$BASE_URL/create_account.php" -o "$tmp_dir/form.html"
token="$(sed -n 's/.*name="formid" value="\([^"]*\)".*/\1/p' "$tmp_dir/form.html" | head -1)"
if [[ -z "$token" ]]; then
  echo "未能从 osCommerce 真实注册页面取得 session form token" >&2
  exit 1
fi

curl "${curl_args[@]}" -L -d \
  "action=process&formid=${token}&gender=m&firstname=${FIRST_NAME}&lastname=${LAST_NAME}&dob=01/01/1990&email_address=${EMAIL}&company=&street_address=1+Benchmark+Road&suburb=&city=Testville&postcode=12345&state=California&country=223&telephone=5551234567&fax=&password=${PASSWORD}&confirmation=${PASSWORD}" \
  "$BASE_URL/create_account.php" -o "$tmp_dir/result.html"

if ! grep -Eqi 'account has been created|create account success|welcome|account_created' "$tmp_dir/result.html"; then
  echo "普通客户注册失败；响应已保存于临时文件前并已清理" >&2
  exit 1
fi

echo "osCommerce 普通客户注册成功：${EMAIL}"

