#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18864}"
BASE_URL="${SILVERPEAS_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${SILVERPEAS_USER:-${ADMIN_USER:-silverpeas}}"
PASSWORD="${SILVERPEAS_PASSWORD:-${ADMIN_PASSWORD:-SilverpeasPassword123!}}"

echo "Checking Silverpeas login at ${BASE_URL} for user: ${USERNAME}..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# 1. Fetch login page to ensure cookies/session can be initialized
curl -sS -c "$COOKIE_JAR" --max-time 15 "${BASE_URL}/silverpeas/defaultLogin.jsp" > /dev/null

# 2. Submit credentials to AuthenticationServlet
LOGIN_RES=$(curl -sS -i -b "$COOKIE_JAR" -c "$COOKIE_JAR" --max-time 15 \
    -d "Login=${USERNAME}" \
    -d "Password=${PASSWORD}" \
    -d "DomainId=0" \
    "${BASE_URL}/silverpeas/AuthenticationServlet")

LOCATION=$(echo "$LOGIN_RES" | grep -i "^location:" | awk '{print $2}' | tr -d '\r')

if [ -z "$LOCATION" ]; then
    echo "FAILED: AuthenticationServlet did not return redirect location."
    echo "$LOGIN_RES" | head -n 25
    exit 1
fi

if echo "$LOCATION" | grep -qi "ErrorCode"; then
    echo "FAILED: AuthenticationServlet rejected credentials (Location: ${LOCATION})"
    exit 1
fi

# 3. Follow redirect to verify authenticated dashboard/frame
DASHBOARD_URL="${LOCATION}"
if [[ "$DASHBOARD_URL" != http* ]]; then
    DASHBOARD_URL="${BASE_URL}${DASHBOARD_URL}"
fi

DASHBOARD_RES=$(curl -sS -L -b "$COOKIE_JAR" --max-time 15 "${DASHBOARD_URL}")

if echo "$DASHBOARD_RES" | grep -qi "silverpeas"; then
    echo "SUCCESS: Silverpeas login verified successfully for user: ${USERNAME}"
    exit 0
else
    echo "FAILED: Dashboard page did not contain expected content."
    exit 1
fi

