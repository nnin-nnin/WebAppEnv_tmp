#!/usr/bin/env bash
set -Eeuo pipefail

url="${ERPNEXT_URL:-http://127.0.0.1:18822}"
body=$(mktemp)
trap 'rm -f "$body"' EXIT

status=$(curl -sS -L --max-time 15 -o "$body" -w '%{http_code}' "$url/")
if [[ "$status" != 200 && "$status" != 302 ]]; then
  echo "ERPNext HTTP check failed: HTTP $status" >&2
  exit 1
fi

if ! grep -Eiq 'frappe|erpnext|login|desk' "$body"; then
  echo "ERPNext HTTP check failed: response does not contain expected ERPNext identifiers" >&2
  exit 1
fi

echo "ERPNext is healthy and reachable at $url (HTTP $status)"
