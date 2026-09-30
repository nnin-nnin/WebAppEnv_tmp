#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18801}"
BASE_URL="${AKENEO_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking Akeneo PIM service readiness at ${BASE_URL}..."

ROOT_STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "${BASE_URL}/" || true)

if [ "$ROOT_STATUS" -ne 200 ] && [ "$ROOT_STATUS" -ne 302 ]; then
    echo "FAILED: Akeneo PIM root returned HTTP ${ROOT_STATUS} (expected 200 or 302)"
    exit 1
fi

echo "Akeneo PIM HTTP status check passed (HTTP ${ROOT_STATUS})."
exit 0
