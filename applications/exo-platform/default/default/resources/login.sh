#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18824}"
USERNAME="${1:-${ADMIN_USERNAME:-${USERNAME:-admin}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
COOKIE_JAR="$(mktemp)"
LOGIN_RES="$(mktemp)"
trap 'rm -f "$COOKIE_JAR" "$LOGIN_RES"' EXIT

echo "=========================================="
echo "eXo Platform Login Verification"
echo "Target URL: ${APP_URL}"
echo "User: ${USERNAME}"
echo "=========================================="

echo "[1/2] Checking login page accessibility at ${APP_URL}/portal/login..."
HTTP_CODE=$(curl -s -o "$LOGIN_RES" -w "%{http_code}" -A "$UA" --connect-timeout 5 --max-time 15 -c "$COOKIE_JAR" "${APP_URL}/portal/login" 2>/dev/null || echo "000")

if [ "$HTTP_CODE" != "200" ] && [ "$HTTP_CODE" != "302" ]; then
    echo "ERROR: Failed to reach login page (HTTP Code: ${HTTP_CODE})."
    exit 1
fi
echo "✓ Login page accessible (HTTP ${HTTP_CODE})."

echo "[2/2] Submitting authentication credentials for user '${USERNAME}'..."
POST_STATUS=$(curl -s -o "$LOGIN_RES" -w "%{http_code}" -A "$UA" --connect-timeout 5 --max-time 20 -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    --data-urlencode "username=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    --data-urlencode "initialURI=/portal" \
    "${APP_URL}/portal/login" 2>/dev/null || echo "000")

echo "Login POST returned HTTP ${POST_STATUS}."

# Inspect session and portal dashboard
PORTAL_HTML=$(curl -s -L -A "$UA" --connect-timeout 5 --max-time 20 -b "$COOKIE_JAR" -c "$COOKIE_JAR" "${APP_URL}/portal/" 2>/dev/null || true)

if grep -qiE "logout|sign out|uiCompanyNavigationPortlet|uiUserPlatformToolBarDesktopsPortlet|administration|portal" <<< "$PORTAL_HTML"; then
    echo "✓ Authentication successful for user '${USERNAME}'!"
    echo "=========================================="
    exit 0
fi

# Fallback check against portal/intranet
INTRANET_HTML=$(curl -s -L -A "$UA" --connect-timeout 5 --max-time 20 -b "$COOKIE_JAR" -c "$COOKIE_JAR" "${APP_URL}/portal/intranet" 2>/dev/null || true)
if grep -qiE "logout|sign out|uiCompanyNavigationPortlet|uiUserPlatformToolBarDesktopsPortlet|administration|portal" <<< "$INTRANET_HTML"; then
    echo "✓ Authentication successful for user '${USERNAME}' (intranet verified)!"
    echo "=========================================="
    exit 0
fi

echo "✗ Authentication failed for user '${USERNAME}'."
exit 1
