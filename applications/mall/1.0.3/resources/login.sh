#!/usr/bin/env bash
set -euo pipefail

base_url="${MALL_URL:-http://localhost:18085}"
admin_user="${MALL_ADMIN_USERNAME:-admin}"
admin_password="${MALL_ADMIN_PASSWORD:-123456}"
timeout="${MALL_TIMEOUT:-20}"

payload="$(printf '{"username":"%s","password":"%s"}' "$admin_user" "$admin_password")"
response="$(curl -fsS --max-time "$timeout" \
  -H 'Content-Type: application/json' \
  -X POST \
  --data "$payload" \
  "$base_url/admin/login")"

if ! grep -Eq '"code"[[:space:]]*:[[:space:]]*200' <<<"$response"; then
  printf 'mall login failed for %s:\n%s\n' "$admin_user" "$response" >&2
  exit 1
fi

token="$(sed -n 's/.*"token"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' <<<"$response" | head -n 1)"
if [[ -z "$token" ]]; then
  echo "mall login response did not contain a token" >&2
  exit 1
fi

info="$(curl -fsS --max-time "$timeout" \
  -H "Authorization: Bearer $token" \
  "$base_url/admin/info")"
if ! grep -Eq '"code"[[:space:]]*:[[:space:]]*200' <<<"$info"; then
  printf 'mall authenticated user check failed:\n%s\n' "$info" >&2
  exit 1
fi

echo "mall login passed: $admin_user"
