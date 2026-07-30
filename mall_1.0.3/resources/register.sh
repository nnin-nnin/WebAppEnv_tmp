#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -lt 2 || "$#" -gt 4 ]]; then
  echo "用法: $0 USERNAME PASSWORD [EMAIL] [NICK_NAME]" >&2
  exit 2
fi

new_user="$1"
new_password="$2"
new_email="${3:-${new_user}@example.com}"
new_nick_name="${4:-Benchmark User}"

case "$new_user$new_password$new_email$new_nick_name" in
  *'"'*|*'\\'*|*$'\n'*)
    echo "注册参数不能包含 JSON 引号、反斜线或换行" >&2
    exit 2
    ;;
esac

base_url="${MALL_URL:-http://localhost:18085}"
timeout="${MALL_TIMEOUT:-20}"
payload="$(printf '{"username":"%s","password":"%s","email":"%s","nickName":"%s","note":"Created by resources/register.sh"}' \
  "$new_user" "$new_password" "$new_email" "$new_nick_name")"

response="$(curl -fsS --max-time "$timeout" \
  -H 'Content-Type: application/json' \
  -X POST \
  --data "$payload" \
  "$base_url/admin/register")"

if ! grep -Eq '"code"[[:space:]]*:[[:space:]]*200' <<<"$response" || \
   ! grep -Eq '"id"[[:space:]]*:' <<<"$response"; then
  printf 'mall registration failed for %s:\n%s\n' "$new_user" "$response" >&2
  exit 1
fi

echo "mall user registered: $new_user"
