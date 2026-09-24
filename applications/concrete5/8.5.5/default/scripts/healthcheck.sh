#!/usr/bin/env bash
set -e

APP_URL="${CONCRETE5_URL:-http://localhost:18618}"

echo "Checking Concrete5 service health..."
HTTP_CODE=$(curl -sS -o /dev/null -w "%{http_code}" "${APP_URL}/" || true)

if [ "$HTTP_CODE" = "200" ]; then
    echo "Healthcheck passed: Concrete5 is responsive (HTTP 200)."
    exit 0
else
    echo "Healthcheck failed: unexpected HTTP status $HTTP_CODE"
    exit 1
fi
