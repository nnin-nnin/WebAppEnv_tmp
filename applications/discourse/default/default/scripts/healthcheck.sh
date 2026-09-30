#!/usr/bin/env bash
set -Eeuo pipefail

url="${DISCOURSE_URL:-http://127.0.0.1:18816}"
body=$(mktemp)
trap 'rm -f "$body"' EXIT

status=$(curl -sS -L --max-time 15 -o "$body" -w '%{http_code}' "$url/")
if [[ "$status" != 200 && "$status" != 302 ]]; then
  echo "Discourse HTTP check failed: HTTP $status" >&2
  exit 1
fi

if ! grep -Eiq 'Discourse|csrf|crawler' "$body"; then
  echo "Discourse HTTP check failed: response does not contain expected forum identifiers" >&2
  exit 1
fi

echo "Discourse is healthy and reachable at $url (HTTP $status)"
