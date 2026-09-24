#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18573}"
URL="${APP_URL:-http://localhost:${HOST_PORT}}"

echo "Checking Grafana service health at ${URL}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/api/health")

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Grafana /api/health returned HTTP $HTTP_CODE!"
else
    echo "FAILED: Grafana /api/health returned HTTP $HTTP_CODE"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
