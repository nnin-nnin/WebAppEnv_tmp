#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18801}"
BASE_URL="${AKENEO_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${AKENEO_USER:-${ADMIN_USER:-admin}}"
PASSWORD="${AKENEO_PASSWORD:-${ADMIN_PASSWORD:-AdminPassword123!}}"

echo "Checking Akeneo PIM login at ${BASE_URL}..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# 1. Fetch login page and extract CSRF token
LOGIN_PAGE=$(curl -sS -c "$COOKIE_JAR" --max-time 15 "${BASE_URL}/user/login")

CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep -o 'name="_csrf_token" value="[^"]*"' | head -n 1 | cut -d'"' -f4)

if [ -z "$CSRF_TOKEN" ]; then
    echo "FAILED: Could not extract CSRF token from login page."
    exit 1
fi

# 2. Submit credentials to login-check
LOGIN_RES=$(curl -sS -i -b "$COOKIE_JAR" -c "$COOKIE_JAR" --max-time 15 \
    -d "_username=${USERNAME}" \
    -d "_password=${PASSWORD}" \
    -d "_csrf_token=${CSRF_TOKEN}" \
    "${BASE_URL}/user/login-check")

# 3. Follow redirect
LOCATION=$(echo "$LOGIN_RES" | grep -i "^location:" | awk '{print $2}' | tr -d '\r')

if [ -z "$LOCATION" ]; then
    echo "FAILED: Login did not return redirect location."
    echo "$LOGIN_RES" | head -n 20
    exit 1
fi

DASHBOARD_RES=$(curl -sS -L -b "$COOKIE_JAR" --max-time 15 "${BASE_URL}/")

if echo "$DASHBOARD_RES" | grep -i "Dashboard" >/dev/null; then
    echo "SUCCESS: Akeneo PIM login verified successfully for user: ${USERNAME}"
    exit 0
else
    echo "FAILED: Login was not successful or dashboard not reached."
    exit 1
fi
