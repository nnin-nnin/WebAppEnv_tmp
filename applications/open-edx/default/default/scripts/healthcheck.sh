#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOST_PORT="${HOST_PORT:-18848}"
BASE_URL="${OPENEDX_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking Open edX LMS readiness at ${BASE_URL}..."

STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "${BASE_URL}/" || true)

if [ "$STATUS" -ne 200 ] && [ "$STATUS" -ne 302 ]; then
    echo "FAILED: Open edX root returned HTTP ${STATUS} (expected 200 or 302)"
    exit 1
fi

echo "Open edX LMS HTTP status check passed (HTTP ${STATUS})."
exit 0
