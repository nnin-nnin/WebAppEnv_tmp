#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18575}"
BASE_URL="http://localhost:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${PLONE_USERNAME:-${PLONE_USER:-${APP_USER:-admin}}}}}"
PASSWORD="${ADMIN_PASSWORD:-${PLONE_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-admin}}}}"

echo "Checking Plone login at ${BASE_URL} for user '${USERNAME}'..."

# Check authenticated endpoint /Plone/@users/${USERNAME}
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -u "${USERNAME}:${PASSWORD}" -H "Accept: application/json" "${BASE_URL}/Plone/@users/${USERNAME}" 2>/dev/null || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Plone authenticated successfully via REST API (HTTP 200)"
    exit 0
fi

# Fallback: check basic auth to /Plone/@@overview-controlpanel
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -u "${USERNAME}:${PASSWORD}" "${BASE_URL}/Plone/@@overview-controlpanel" 2>/dev/null || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Plone authenticated successfully via controlpanel (HTTP 200)"
    exit 0
fi

# Fallback: check basic auth to /Plone
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -u "${USERNAME}:${PASSWORD}" "${BASE_URL}/Plone" 2>/dev/null || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Plone responded successfully (HTTP 200)"
    exit 0
fi

echo "FAILED: Plone login verification failed (HTTP ${HTTP_CODE})"
exit 1
