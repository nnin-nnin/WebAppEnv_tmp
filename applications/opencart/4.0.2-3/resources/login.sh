#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${OPENCART_URL:-http://localhost:18523/}"
admin_url="${OPENCART_ADMIN_URL:-${base_url%/}/admin/}"
username="${OPENCART_USERNAME:-admin}"
password="${OPENCART_PASSWORD:-${CODEX_ADMIN_PASSWORD:-}}"

if [ -z "$password" ]; then
    echo '登录失败：请通过 OPENCART_PASSWORD 或受控 CODEX_ADMIN_PASSWORD 提供密码。' >&2
    exit 2
fi

cookie_file="$(mktemp)"
login_page="$(mktemp)"
response_file="$(mktemp)"
dashboard_file="$(mktemp)"
cleanup() { rm -f "$cookie_file" "$login_page" "$response_file" "$dashboard_file"; }
trap cleanup EXIT

curl -fsS -L -c "$cookie_file" -b "$cookie_file" "$admin_url" -o "$login_page"
login_action="$(sed -n 's/.*action="\([^"]*common\/login\.login[^"]*\)".*/\1/p' "$login_page" | head -n 1 | sed 's/&amp;/\&/g')"
if [ -z "$login_action" ]; then
    echo '登录失败：未找到 OpenCart 后台登录表单。' >&2
    exit 1
fi

curl -fsS -L -c "$cookie_file" -b "$cookie_file" \
    -H 'X-Requested-With: XMLHttpRequest' \
    --data-urlencode "username=$username" \
    --data-urlencode "password=$password" \
    --data-urlencode 'redirect=' \
    "$login_action" -o "$response_file"

if ! grep -Eq '"redirect"[[:space:]]*:' "$response_file" || grep -Eq '"error"[[:space:]]*:' "$response_file"; then
    echo '登录失败：OpenCart 拒绝了管理员凭据。' >&2
    exit 1
fi

dashboard_url="$(sed -n 's/.*"redirect"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$response_file" | head -n 1 | sed 's#\\/#/#g')"
if [ -z "$dashboard_url" ]; then
    echo '登录失败：OpenCart 未返回后台跳转地址。' >&2
    exit 1
fi

if ! curl -fsS -L --max-time 15 -c "$cookie_file" -b "$cookie_file" "$dashboard_url" -o "$dashboard_file"; then
    echo '登录失败：无法使用返回的会话访问后台。' >&2
    exit 1
fi

if ! grep -Eq 'id="nav-logout"|route=common/logout' "$dashboard_file" || ! grep -Eq 'user_token=[^"&<[:space:]]+' "$dashboard_file"; then
    echo '登录失败：返回的会话未通过后台认证检查。' >&2
    exit 1
fi
echo "OpenCart 管理员登录成功：$username"
