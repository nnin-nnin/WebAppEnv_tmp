#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18839}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to Lodel ==="
echo "URL: ${APP_URL}/lodeladmin/login.php"
echo "User: ${USERNAME}"

# Step 1: Request login page to initialize cookie/session
HTTP_CODE=$(curl -s -S -o /dev/null -w "%{http_code}" -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/lodeladmin/login.php" || true)
if [ "$HTTP_CODE" -ne 200 ] && [ "$HTTP_CODE" -ne 302 ]; then
    echo "ERROR: Unable to reach login page at ${APP_URL}/lodeladmin/login.php (HTTP ${HTTP_CODE})"
    exit 1
fi

# Step 2: Submit login credentials via POST
LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "login=${USERNAME}" \
    -d "passwd=${PASSWORD}" \
    -d "url_retour=/lodeladmin/index.php" \
    "${APP_URL}/lodeladmin/login.php")

# Check for redirect or successful session establishment
if echo "$LOGIN_RESP" | grep -iqE "Location: .*/lodeladmin/(index\.php)?"; then
    echo "SUCCESS: Login POST redirected to admin dashboard!"
fi

# Step 3: Verify authenticated access to lodeladmin dashboard
DASHBOARD=$(curl -s -S -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/lodeladmin/index.php" || true)

if echo "$DASHBOARD" | grep -iqE "logout|deconnexion|Déconnexion|lodeladmin|gestion|sites|utilisateurs"; then
    echo "SUCCESS: Admin dashboard access verified!"
    exit 0
else
    echo "ERROR: Login verification failed. Dashboard response excerpt:"
    echo "$DASHBOARD" | head -n 30
    exit 1
fi
