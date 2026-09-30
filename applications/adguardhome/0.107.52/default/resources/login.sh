#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18683}"
URL="http://127.0.0.1:${HOST_PORT}/"
USERNAME="${ADMIN_USERNAME:-${USERNAME:-${APP_USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-${APP_PASSWORD:-Admin123456!}}}"

echo "Checking AdGuard Home root endpoint at ${URL}..."

HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "$URL" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: AdGuard Home root endpoint returned HTTP 200."
else
    echo "FAILED: AdGuard Home root endpoint returned HTTP ${HTTP_CODE}."
    exit 1
fi

echo "Verifying administrative account authentication via login API..."
LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -X POST "${URL}control/login" \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}")

if [ "$LOGIN_CODE" -eq 200 ]; then
    echo "SUCCESS: AdGuard Home login API authentication succeeded (HTTP 200)."
else
    echo "FAILED: AdGuard Home login API returned HTTP ${LOGIN_CODE}."
    exit 1
fi

echo "Verifying administrative status API with basic auth..."
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" -u "${USERNAME}:${PASSWORD}" "${URL}control/status")

if [ "$STATUS_CODE" -eq 200 ]; then
    echo "SUCCESS: AdGuard Home status API verified (HTTP 200)."
else
    echo "FAILED: AdGuard Home status API returned HTTP ${STATUS_CODE}."
    exit 1
fi

echo "Login check PASSED!"
exit 0
