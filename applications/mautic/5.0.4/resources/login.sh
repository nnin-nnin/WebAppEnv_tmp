#!/usr/bin/env bash
set -euo pipefail

base_url="${MAUTIC_URL:-http://localhost:18518}"
username="${MAUTIC_USERNAME:-admin}"
: "${MAUTIC_PASSWORD:?Set MAUTIC_PASSWORD through the controlled credential channel}"

response_file="$(mktemp)"
trap 'rm -f "$response_file"' EXIT
status="$(curl -sS -L -o "$response_file" -w '%{http_code}' \
  -u "$username:$MAUTIC_PASSWORD" \
  -H 'Accept: application/json' \
  "$base_url/api/users/self")"

if [ "$status" != 200 ] || ! grep -Eq '"username"[[:space:]]*:[[:space:]]*"'"$username"'"' "$response_file"; then
  echo "Mautic API login failed (HTTP $status)" >&2
  exit 1
fi

echo "Mautic API login succeeded for $username"
