#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://localhost:18007}"
USERNAME="${ADMIN_USERNAME:-${USERNAME:-admin}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-benchmark-only}}"

TMP_COOKIE="$(mktemp)"
TMP_PAGE="$(mktemp)"
trap 'rm -f "$TMP_COOKIE" "$TMP_PAGE"' EXIT

# Step 1: GET homepage to acquire session cookie and security key
curl -s -c "$TMP_COOKIE" "${APP_URL}/" > "$TMP_PAGE"

SEC_KEY=$(python3 -c "import re; html=open('$TMP_PAGE').read(); m=re.search(r'ALTO_SECURITY_KEY\s*=\s*[\'\"]([^\'\"]+)', html); print(m.group(1) if m else '')")

if [ -z "$SEC_KEY" ]; then
    echo "ERROR: Failed to extract ALTO_SECURITY_KEY from ${APP_URL}"
    exit 1
fi

# Step 2: POST login credentials
RESPONSE=$(curl -s -b "$TMP_COOKIE" -c "$TMP_COOKIE" -X POST "${APP_URL}/login/ajax-login/" \
    -H "X-Requested-With: XMLHttpRequest" \
    -d "login=${USERNAME}" \
    -d "password=${PASSWORD}" \
    -d "remember=1" \
    -d "security_key=${SEC_KEY}")

if echo "$RESPONSE" | grep -q '"bStateError":false'; then
    echo "Login successful for user: ${USERNAME}"
    exit 0
else
    echo "Login failed for user: ${USERNAME}. Response: ${RESPONSE}"
    exit 1
fi
