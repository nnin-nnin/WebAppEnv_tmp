#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18561}"
BASE_URL="http://localhost:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

echo "Checking DokuWiki login at ${BASE_URL}..."
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

LOGIN_PAGE=$(curl -s -c "$COOKIE_JAR" "${BASE_URL}/doku.php?do=login")
SECTOK=$(echo "$LOGIN_PAGE" | grep -o 'name="sectok" value="[^"]*"' | head -1 | cut -d'"' -f4)

LOGIN_RESP=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" -X POST \
    -d "id=start&do=login&sectok=${SECTOK}&u=${USERNAME}&p=${PASSWORD}" \
    -L "${BASE_URL}/doku.php?id=start")

if echo "$LOGIN_RESP" | grep -qi "Logged in as"; then
    echo "SUCCESS: DokuWiki login succeeded for user '${USERNAME}'"
    exit 0
else
    echo "FAILED: DokuWiki login failed"
    exit 1
fi
