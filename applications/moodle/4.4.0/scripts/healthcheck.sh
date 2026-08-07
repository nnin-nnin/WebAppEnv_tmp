#!/usr/bin/env bash
set -Eeuo pipefail

url="${MOODLE_URL:-http://localhost:18521}"
url="${url%/}"
body="$(mktemp)"
trap 'rm -f "$body"' EXIT
status="$(curl -sS -L --max-time 15 -o "$body" -w '%{http_code}' "$url/")"
if [[ "$status" != 200 ]] || ! grep -Eqi 'Moodle|login' "$body"; then
    echo "Moodle HTTP health check failed at ${url}/ (status ${status})." >&2
    exit 1
fi
echo "Moodle HTTP health check succeeded at ${url}/."
