#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18773}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${STRUTS2_SHOWCASE_USER:-${ADMIN_USER:-${USERNAME:-admin}}}"

echo "Validating Struts2 Showcase entry at ${BASE_URL} for user ${USERNAME}..."

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

code=$(curl --max-time 15 -sS -L -o "$tmp" -w "%{http_code}" "${BASE_URL}/")
if [ "$code" -ne 200 ]; then
  # Try /showcase/ as alternative endpoint
  code=$(curl --max-time 15 -sS -L -o "$tmp" -w "%{http_code}" "${BASE_URL}/showcase/")
fi

if [ "$code" -eq 200 ] && grep -Eiq 'Struts|Showcase|Fileupload' "$tmp"; then
  echo "Struts2 Showcase validation successful: application accessible and responsive (HTTP ${code})"
  exit 0
else
  echo "Struts2 Showcase entry verification failed (HTTP ${code})" >&2
  exit 1
fi
