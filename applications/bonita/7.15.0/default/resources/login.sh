#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18578}"
BASE_URL="http://localhost:${HOST_PORT}"
USER="${BONITA_USER:-${APP_USER:-${ADMIN_USER:-install}}}"
PASS="${BONITA_PASSWORD:-${APP_PASSWORD:-${ADMIN_PASSWORD:-install}}}"

echo "Checking Bonita BPM login at ${BASE_URL}/bonita/loginservice for user '${USER}'..."

# Verify endpoint availability
HTTP_PAGE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/bonita/" || true)
if [ "$HTTP_PAGE" -ne 200 ] && [ "$HTTP_PAGE" -ne 302 ]; then
    echo "FAILED: Bonita web interface not reachable at ${BASE_URL}/bonita/ (HTTP ${HTTP_PAGE})"
    exit 1
fi

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

HTTP_CODE=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" -o /dev/null -w "%{http_code}" -X POST \
    -d "username=${USER}&password=${PASS}" \
    "${BASE_URL}/bonita/loginservice?redirect=false" || true)

if [ "$HTTP_CODE" -eq 204 ] || [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "SUCCESS: Bonita authentication verified successfully for user '${USER}' (HTTP ${HTTP_CODE})"
    exit 0
fi

# Fallback check for admin/bpm if install/install failed
if [ "${USER}" != "admin" ]; then
    echo "Trying fallback credentials admin/bpm..."
    HTTP_CODE=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" -o /dev/null -w "%{http_code}" -X POST \
        -d "username=admin&password=bpm" \
        "${BASE_URL}/bonita/loginservice?redirect=false" || true)
    if [ "$HTTP_CODE" -eq 204 ] || [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
        echo "SUCCESS: Bonita authentication verified successfully with fallback credentials (HTTP ${HTTP_CODE})"
        exit 0
    fi
fi

echo "FAILED: Bonita authentication failed (HTTP ${HTTP_CODE})"
exit 1
