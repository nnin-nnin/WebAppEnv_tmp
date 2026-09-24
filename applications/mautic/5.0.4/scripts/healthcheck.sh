#!/usr/bin/env bash
set -euo pipefail

base_url="${MAUTIC_URL:-http://localhost:18518}"
response_file="$(mktemp)"
trap 'rm -f "$response_file"' EXIT

status="$(curl -s -L --connect-timeout 5 --max-time 15 -o "$response_file" -w '%{http_code}' "$base_url/s/login" || echo "000")"
if [ "$status" != "200" ] || ! grep -Eiq 'mautic|login|password' "$response_file"; then
  echo "Mautic HTTP health check failed (HTTP $status)" >&2
  exit 1
fi

echo "Mautic HTTP health check succeeded: $base_url/s/login"
