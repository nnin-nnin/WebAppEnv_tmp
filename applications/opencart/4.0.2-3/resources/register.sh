#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${OPENCART_URL:-http://localhost:18523/}"
email="${1:-${OPENCART_REGISTER_EMAIL:-}}"
password="${2:-${OPENCART_REGISTER_PASSWORD:-}}"
firstname="${3:-${OPENCART_REGISTER_FIRSTNAME:-Test}}"
lastname="${4:-${OPENCART_REGISTER_LASTNAME:-User}}"

if [ -z "$email" ] || [ -z "$password" ]; then
    echo '用法：OPENCART_URL=... resources/register.sh <email> <password> [firstname] [lastname]' >&2
    exit 2
fi

cookie_file="$(mktemp)"
register_page="$(mktemp)"
response_file="$(mktemp)"
cleanup() { rm -f "$cookie_file" "$register_page" "$response_file"; }
trap cleanup EXIT

register_url="${base_url%/}/index.php?route=account/register&language=en-gb"
curl -fsS -L -c "$cookie_file" -b "$cookie_file" "$register_url" -o "$register_page"
register_action="$(sed -n 's/.*action="\([^"]*account\/register\.register[^"]*\)".*/\1/p' "$register_page" | head -n 1 | sed 's/&amp;/\&/g')"
if [ -z "$register_action" ]; then
    echo '注册失败：未找到 OpenCart 公开注册表单。' >&2
    exit 1
fi

curl -fsS -L -c "$cookie_file" -b "$cookie_file" \
    -H 'X-Requested-With: XMLHttpRequest' \
    --data-urlencode 'customer_group_id=1' \
    --data-urlencode "firstname=$firstname" \
    --data-urlencode "lastname=$lastname" \
    --data-urlencode "email=$email" \
    --data-urlencode 'telephone=123456789' \
    --data-urlencode "password=$password" \
    --data-urlencode "confirm=$password" \
    --data-urlencode 'agree=1' \
    "$register_action" -o "$response_file"

if grep -Eq '"error"[[:space:]]*:' "$response_file" || ! grep -Eq '"(success|redirect|customer_token)"[[:space:]]*:' "$response_file"; then
    echo '注册失败：OpenCart 未接受普通客户注册请求。' >&2
    exit 1
fi
echo "OpenCart 普通客户注册成功：$email"
