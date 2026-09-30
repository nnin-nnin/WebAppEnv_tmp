#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18843}"
BASE_URL="${MISP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking MISP service health at ${BASE_URL}..."

ROOT_STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "${BASE_URL}/" || true)

if [ "$ROOT_STATUS" -ne 200 ] && [ "$ROOT_STATUS" -ne 302 ]; then
    echo "FAILED: MISP root returned HTTP ${ROOT_STATUS} (expected 200 or 302)"
    exit 1
fi

LOGIN_STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "${BASE_URL}/users/login" || true)

if [ "$LOGIN_STATUS" -ne 200 ] && [ "$LOGIN_STATUS" -ne 302 ]; then
    echo "FAILED: MISP login page returned HTTP ${LOGIN_STATUS} (expected 200 or 302)"
    exit 1
fi

echo "MISP HTTP status check passed (Root HTTP ${ROOT_STATUS}, Login HTTP ${LOGIN_STATUS})."
exit 0
