#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18809}"
BASE_URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"

USERNAME="${1:-admin}"
PASSWORD="${2:-AdminPassword123!}"

echo "Testing login for user: ${USERNAME} at ${BASE_URL}..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Perform login POST
LOGIN_RESPONSE=$(curl -s -c "$COOKIE_JAR" -b "$COOKIE_JAR" \
    -e "${BASE_URL}/login.php" \
    -d "rusername=${USERNAME}" \
    -d "rpassword=${PASSWORD}" \
    -d "rremember=1" \
    -X POST "${BASE_URL}/login.php?a=check" -w "%{http_code}" -o /dev/null || true)

echo "Login POST HTTP status: ${LOGIN_RESPONSE}"

# Check admin dashboard access
ADMIN_HTTP_CODE=$(curl -s -b "$COOKIE_JAR" -w "%{http_code}" -o /dev/null "${BASE_URL}/admin.php" || true)

if [ "${ADMIN_HTTP_CODE}" -eq 200 ]; then
    echo "Login successful: Administrator dashboard accessed with HTTP 200"
    exit 0
else
    echo "Login failed: Administrator dashboard returned HTTP ${ADMIN_HTTP_CODE} (expected 200)"
    exit 1
fi
