#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18773}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Struts2 Showcase health at ${BASE_URL}..."

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

HTTP_CODE=$(curl -sS -L --max-time 10 -o "$tmp" -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
  echo "Health check FAILED: expected HTTP 200, got ${HTTP_CODE}"
  exit 1
fi

if grep -Eiq 'Struts2|Showcase|Fileupload' "$tmp"; then
  echo "Struts2 Showcase HTTP health check PASSED (${BASE_URL}/)"
  exit 0
else
  echo "Health check FAILED: page content does not match Struts2 Showcase"
  exit 1
fi
