#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18769}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${XSS_LABS_USER:-${ADMIN_USER:-${USERNAME:-admin}}}"

echo "Validating xss-labs service and entry at ${BASE_URL} for user ${USERNAME}..."

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

code=$(curl --max-time 15 -sS -L -o "$tmp" -w "%{http_code}" "${BASE_URL}/")
if [ "$code" -ne 200 ]; then
  echo "xss-labs root validation failed (HTTP ${code})" >&2
  exit 1
fi

level_code=$(curl --max-time 15 -sS -L -o "$tmp" -w "%{http_code}" "${BASE_URL}/level1.php?name=test")
if [ "$level_code" -eq 200 ] && grep -Eiq 'level1|test' "$tmp"; then
  echo "xss-labs validation successful: application accessible and responsive (HTTP ${level_code})"
  exit 0
else
  echo "xss-labs challenge entry check failed (HTTP ${level_code})" >&2
  exit 1
fi
