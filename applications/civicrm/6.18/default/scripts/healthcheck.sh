#!/usr/bin/env bash
set -e

APP_URL="${CIVICRM_URL:-http://localhost:18599}"

echo "Checking CiviCRM service health..."
HTTP_CODE=$(curl -sS -o /dev/null -w "%{http_code}" "${APP_URL}/civicrm/login" || true)

if [ "$HTTP_CODE" = "200" ]; then
    echo "Healthcheck passed: CiviCRM is responsive (HTTP 200)."
    exit 0
else
    echo "Healthcheck failed: unexpected HTTP status $HTTP_CODE"
    exit 1
fi
