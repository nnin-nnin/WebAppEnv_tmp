#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$APP_DIR/docker/compose.yaml"

APP_URL="${APP_URL:-http://127.0.0.1:18836}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-admin}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-123456}}"

echo "Checking jshERP service accessibility at $APP_URL/ ..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL/" || true)
if [ "$HTTP_CODE" != "200" ] && [ "$HTTP_CODE" != "302" ]; then
    echo "Error: Service at $APP_URL/ is not accessible (HTTP $HTTP_CODE)."
    exit 1
fi
echo "Service is accessible at $APP_URL/ (HTTP $HTTP_CODE)."

# Format MD5 password if plain text provided
if [[ "$PASSWORD" =~ ^[0-9a-fA-F]{32}$ ]]; then
    PASS_MD5="$PASSWORD"
else
    if command -v md5sum >/dev/null 2>&1; then
        PASS_MD5=$(printf "%s" "$PASSWORD" | md5sum | awk '{print $1}')
    elif command -v md5 >/dev/null 2>&1; then
        PASS_MD5=$(printf "%s" "$PASSWORD" | md5 -q)
    else
        PASS_MD5="e10adc3949ba59abbe56e057f20f883e"
    fi
fi

echo "Requesting captcha from $APP_URL/jshERP-boot/user/randomImage..."
RAND_RESP=$(curl -s "$APP_URL/jshERP-boot/user/randomImage")
UUID=$(echo "$RAND_RESP" | grep -o '"uuid":"[^"]*"' | head -n 1 | cut -d'"' -f4)

if [ -z "$UUID" ]; then
    echo "Error: Failed to obtain captcha UUID."
    echo "Response: $RAND_RESP"
    exit 1
fi

echo "Obtained captcha UUID: $UUID"
CODE=$(docker compose -f "$COMPOSE_FILE" exec -T redis redis-cli -a 1234abcd get "captcha_codes:$UUID" 2>/dev/null | tr -d '\r\n' || true)

if [ -z "$CODE" ] || [ "$CODE" = "nil" ]; then
    REDIS_CONTAINER=$(docker compose -f "$COMPOSE_FILE" ps -q redis 2>/dev/null || true)
    if [ -n "$REDIS_CONTAINER" ]; then
        CODE=$(docker exec "$REDIS_CONTAINER" redis-cli -a 1234abcd get "captcha_codes:$UUID" 2>/dev/null | tr -d '\r\n' || true)
    fi
fi

echo "Obtained captcha code: $CODE"
echo "Attempting login to $APP_URL/jshERP-boot/user/login as $USERNAME..."

LOGIN_RESP=$(curl -s -X POST "$APP_URL/jshERP-boot/user/login" \
    -H "Content-Type: application/json" \
    -d "{\"loginName\":\"$USERNAME\",\"password\":\"$PASS_MD5\",\"code\":\"$CODE\",\"uuid\":\"$UUID\"}")

echo "Login response: $LOGIN_RESP"

if echo "$LOGIN_RESP" | grep -q '"code":200' && echo "$LOGIN_RESP" | grep -q '"token"'; then
    echo "Login successful! Session token validated."
    exit 0
else
    echo "Login failed. Credentials or response did not validate."
    exit 1
fi
