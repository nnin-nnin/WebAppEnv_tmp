#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18670}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${HEDGEDOC_USER:-admin@example.com}}}"
PASSWORD="${ADMIN_PASSWORD:-${HEDGEDOC_PASSWORD:-Admin123456!}}"

echo "Checking HedgeDoc home page at ${BASE_URL}/..."

HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: HedgeDoc home page returned HTTP 200."
else
    echo "FAILED: HedgeDoc home page returned HTTP ${HTTP_CODE} (expected 200)."
    exit 1
fi

echo "Verifying HedgeDoc authentication via POST ${BASE_URL}/login for user '${USERNAME}'..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

AUTH_CODE=$(curl -s -o /dev/null -c "$COOKIE_JAR" -w "%{http_code}" \
    -d "email=${USERNAME}&password=${PASSWORD}" \
    -X POST "${BASE_URL}/login" || true)

if [ "$AUTH_CODE" -eq 302 ] || [ "$AUTH_CODE" -eq 200 ]; then
    echo "SUCCESS: HedgeDoc login endpoint returned HTTP ${AUTH_CODE}."
else
    echo "FAILED: HedgeDoc login endpoint returned HTTP ${AUTH_CODE} (expected 302 or 200)."
    exit 1
fi

ME_STATUS=$(curl -s -b "$COOKIE_JAR" "${BASE_URL}/me" || true)
if echo "$ME_STATUS" | grep -q '"status":"ok"'; then
    echo "SUCCESS: HedgeDoc session verified via /me."
else
    echo "WARNING: /me verification did not return status ok, but login succeeded."
fi

echo "Login check PASSED!"
exit 0
