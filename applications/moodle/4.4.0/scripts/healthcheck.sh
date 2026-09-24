#!/usr/bin/env bash
set -Eeuo pipefail

url="${MOODLE_URL:-http://127.0.0.1:18521}"
url="${url%/}"
body="$(mktemp)"
trap 'rm -f "$body"' EXIT

ready=0
for i in {1..30}; do
  status="$(curl -sS -L --max-time 10 -o "$body" -w '%{http_code}' "$url/" 2>/dev/null || true)"
  if [[ "$status" == 200 ]] && grep -Eqi 'Moodle|login' "$body"; then
    ready=1
    break
  fi
  sleep 3
done

if [ "$ready" -ne 1 ]; then
    echo "Moodle HTTP health check failed at ${url}/ (status ${status:-none})." >&2
    exit 1
fi
echo "Moodle HTTP health check succeeded at ${url}/."
