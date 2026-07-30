#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -lt 2 || "$#" -gt 3 ]]; then
  echo "Usage: $0 USERNAME PASSWORD [LAST_NAME]" >&2
  exit 2
fi

new_user="$1"
new_password="$2"
last_name="${3:-Benchmark User}"

case "$new_user$new_password$last_name" in
  *'"'*|*'\\'*|*$'\n'*)
    echo "Username, password and last name cannot contain JSON quote or backslash characters" >&2
    exit 2
    ;;
esac

base_url="${ATROPIM_URL:-http://localhost:18083}"
admin_user="${BENCHMARK_ADMIN_USER:-admin}"
admin_password="${BENCHMARK_ADMIN_PASSWORD:-benchmark-only}"
payload="$(printf '{"userName":"%s","password":"%s","lastName":"%s","type":"regular","isActive":true}' "$new_user" "$new_password" "$last_name")"

auth_response="$(curl -fsS --max-time "${HEALTHCHECK_TIMEOUT:-15}" \
  -u "${admin_user}:${admin_password}" \
  "$base_url/api/v1/App/user")"
auth_token="$(printf '%s' "$auth_response" | sed -n 's/.*"token":"\([^"]*\)".*/\1/p')"

if [[ -z "$auth_token" ]]; then
  echo "AtroPIM registration failed: could not obtain an API token" >&2
  exit 1
fi

auth_header="$(printf '%s' "${admin_user}:${auth_token}" | base64 | tr -d '\n')"
response="$(curl -fsS --max-time "${HEALTHCHECK_TIMEOUT:-15}" \
  -H "Authorization-Token: $auth_header" \
  -H 'Content-Type: application/json' \
  -X POST \
  --data "$payload" \
  "$base_url/api/v1/User")"

if ! grep -Eq '"id"[[:space:]]*:' <<<"$response"; then
  printf 'AtroPIM registration failed:\n%s\n' "$response" >&2
  exit 1
fi

echo "AtroPIM user registered: $new_user"
