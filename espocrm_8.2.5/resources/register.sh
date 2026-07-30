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

base_url="${ESPOCRM_URL:-http://localhost:18092}"
admin_user="${BENCHMARK_ADMIN_USERNAME:-admin}"
admin_password="${BENCHMARK_ADMIN_PASSWORD:-benchmark-only}"
payload="$(printf '{"userName":"%s","password":"%s","lastName":"%s","type":"regular","isActive":true}' "$new_user" "$new_password" "$last_name")"

response="$(curl -fsS --max-time "${HEALTHCHECK_TIMEOUT:-15}" \
  -u "${admin_user}:${admin_password}" \
  -H 'Content-Type: application/json' \
  -X POST \
  --data "$payload" \
  "$base_url/api/v1/User")"

if ! grep -Eq '"id"[[:space:]]*:' <<<"$response"; then
  printf 'EspoCRM registration failed:\n%s\n' "$response" >&2
  exit 1
fi

echo "EspoCRM user registered: $new_user"
