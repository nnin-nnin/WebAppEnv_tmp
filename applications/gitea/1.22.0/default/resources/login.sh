#!/usr/bin/env bash
set -e

APP_URL="${APP_URL:-http://127.0.0.1:18655}"
USERNAME="${1:-${ADMIN_USERNAME:-${APP_USER:-admin}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${APP_PASSWORD:-Admin123456!}}}"

echo "Checking Gitea service accessibility at ${APP_URL}..."
LOGIN_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/user/login" 2>/dev/null || true)
INDEX_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/" 2>/dev/null || true)

if [ "${LOGIN_STATUS}" != "200" ] && [ "${INDEX_STATUS}" != "200" ]; then
    echo "Error: Neither /user/login (${LOGIN_STATUS}) nor / (${INDEX_STATUS}) returned HTTP 200."
    exit 1
fi
echo "HTTP endpoint check passed (/user/login status: ${LOGIN_STATUS}, / status: ${INDEX_STATUS})."

echo "Verifying user credentials for '${USERNAME}' via Gitea API..."
API_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -u "${USERNAME}:${PASSWORD}" "${APP_URL}/api/v1/user" 2>/dev/null || true)
if [ "${API_STATUS}" = "200" ]; then
    echo "Login successful for user '${USERNAME}' (API status: 200)!"
    exit 0
else
    echo "API authentication returned ${API_STATUS}. Checking web login session..."
    COOKIE_JAR=$(mktemp)
    trap 'rm -f "${COOKIE_JAR}"' EXIT
    CSRF_TOKEN=$(curl -s -c "${COOKIE_JAR}" "${APP_URL}/user/login" | grep -o 'name="_csrf" value="[^"]*"' | head -1 | cut -d'"' -f4)
    if [ -n "${CSRF_TOKEN}" ]; then
        POST_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -b "${COOKIE_JAR}" -c "${COOKIE_JAR}" -X POST "${APP_URL}/user/login" \
            -d "_csrf=${CSRF_TOKEN}" \
            -d "user_name=${USERNAME}" \
            -d "password=${PASSWORD}" 2>/dev/null || true)
        if [ "${POST_STATUS}" = "303" ] || [ "${POST_STATUS}" = "302" ] || [ "${POST_STATUS}" = "200" ]; then
            echo "Web login successful for user '${USERNAME}' (HTTP status: ${POST_STATUS})!"
            exit 0
        fi
    fi
    echo "Login verification failed for user '${USERNAME}'."
    exit 1
fi
