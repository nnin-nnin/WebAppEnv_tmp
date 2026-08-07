#!/usr/bin/env bash
set -Eeuo pipefail

BASE_URL="${OSCOMMERCE_URL:-http://127.0.0.1:18402}"
USERNAME="${OSCOMMERCE_ADMIN_USERNAME:-admin}"
PASSWORD="${OSCOMMERCE_ADMIN_PASSWORD:-benchmark-only}"
BASE_URL="${BASE_URL%/}"

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

curl_args=(-fsS --max-time "${OSCOMMERCE_TIMEOUT:-20}" -c "$tmp_dir/cookies" -b "$tmp_dir/cookies" -L)
curl "${curl_args[@]}" "$BASE_URL/admin/login.php" -o "$tmp_dir/login.html"
curl "${curl_args[@]}" -d "username=${USERNAME}&password=${PASSWORD}" \
  "$BASE_URL/admin/login.php?action=process" -o "$tmp_dir/result.html"

# 原判定含 'osCommerce'/'Administration'——登录页同样命中。改为检查登录后才有的登出入口。
if ! grep -Eq 'logoff\.php' "$tmp_dir/result.html"; then
  echo "osCommerce 管理员登录失败：$BASE_URL/admin/" >&2
  exit 1
fi

echo "osCommerce 管理员登录成功：${USERNAME}"

