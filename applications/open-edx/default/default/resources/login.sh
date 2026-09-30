#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18848}"
BASE_URL="${OPENEDX_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${OPENEDX_USER:-${ADMIN_USER:-admin@example.com}}"
PASSWORD="${OPENEDX_PASSWORD:-${ADMIN_PASSWORD:-AdminPassword123!}}"

echo "Verifying Open edX LMS authentication at ${BASE_URL}..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Step 1: Fetch login page and extract CSRF token
LOGIN_PAGE=$(curl -sS -c "$COOKIE_JAR" --max-time 15 "${BASE_URL}/login")

CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep -o 'name="csrf_token" value="[^"]*"' | head -n 1 | cut -d'"' -f4)

if [ -z "$CSRF_TOKEN" ]; then
    # Fallback extraction from cookie
    CSRF_TOKEN=$(grep "csrftoken" "$COOKIE_JAR" | awk '{print $NF}' | tail -n 1)
fi

echo "CSRF token acquired. Submitting login credentials for: ${USERNAME}..."

# Step 2: Submit credentials to /login
LOGIN_RES=$(curl -sS -i -b "$COOKIE_JAR" -c "$COOKIE_JAR" --max-time 15 \
    -d "email_or_username=${USERNAME}" \
    -d "password=${PASSWORD}" \
    -d "csrf_token=${CSRF_TOKEN}" \
    "${BASE_URL}/login")

# Step 3: Check response or redirect
LOCATION=$(echo "$LOGIN_RES" | grep -i "^location:" | awk '{print $2}' | tr -d '\r')

if [ -z "$LOCATION" ]; then
    # Try AJAX endpoint fallback
    AJAX_RES=$(curl -sS -b "$COOKIE_JAR" -c "$COOKIE_JAR" --max-time 15 \
        -H "Content-Type: application/json" \
        -H "X-CSRFToken: ${CSRF_TOKEN}" \
        -d "{\"email_or_username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}" \
        "${BASE_URL}/user_api/v1/account/login_session/")
    if echo "$AJAX_RES" | grep -i '"success":\s*true' >/dev/null; then
        LOCATION="/dashboard"
    fi
fi

if [ -z "$LOCATION" ]; then
    echo "FAILED: Login did not return a valid redirect location or session."
    echo "$LOGIN_RES" | head -n 25
    exit 1
fi

# Step 4: Access protected dashboard
DASHBOARD_RES=$(curl -sS -L -b "$COOKIE_JAR" --max-time 15 "${BASE_URL}/dashboard")

if echo "$DASHBOARD_RES" | grep -i -E "Dashboard|admin|Courses" >/dev/null; then
    echo "SUCCESS: Open edX LMS login verified successfully for user: ${USERNAME}"
    exit 0
else
    echo "FAILED: Dashboard could not be verified after login."
    exit 1
fi
