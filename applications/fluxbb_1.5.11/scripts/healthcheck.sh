#!/bin/bash
set -Eeuo pipefail
url="${FLUXBB_URL:-http://127.0.0.1:18311/}"
body=$(mktemp)
trap 'rm -f "$body"' EXIT
status=$(curl --silent --show-error --fail --max-time 10 --output "$body" --write-out '%{http_code}' "$url")
[ "$status" = 200 ] || { echo "FluxBB HTTP status: $status" >&2; exit 1; }
grep -Eqi 'FluxBB|login\.php|Forum' "$body" || { echo 'FluxBB application marker missing' >&2; exit 1; }
echo "FluxBB healthy: $url (HTTP $status)"
