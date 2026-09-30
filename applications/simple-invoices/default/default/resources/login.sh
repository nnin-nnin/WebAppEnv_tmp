#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18865}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "[*] Testing Simple Invoices authentication at ${BASE_URL}/index.php?module=auth&view=login..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Step 1: Fetch login page to retrieve CSRF token and initial session cookie
LOGIN_PAGE=$(curl --noproxy "*" -s -c "$COOKIE_JAR" "${BASE_URL}/index.php?module=auth&view=login")
CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep -oE 'name="csrfprotectionbysr" value="[^"]+"' | head -n 1 | cut -d '"' -f 4)

if [ -z "$CSRF_TOKEN" ]; then
    echo "[-] FAILED: Could not extract CSRF token from login page."
    exit 1
fi

echo "[+] Got CSRF token: ${CSRF_TOKEN}"

# Step 2: Post credentials with session cookie and CSRF token
LOGIN_RESPONSE=$(curl --noproxy "*" -sL -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -d "action=login" \
    -d "csrfprotectionbysr=${CSRF_TOKEN}" \
    -d "user=admin@example.com" \
    -d "pass=AdminPassword123!" \
    -d "ui_language=" \
    "${BASE_URL}/index.php?module=auth&view=login")

# Step 3: Verify authenticated session on dashboard
if echo "$LOGIN_RESPONSE" | grep -qi "logout\|log out\|module=index"; then
    echo "[+] SUCCESS: Successfully logged in to Simple Invoices dashboard as admin@example.com!"
    exit 0
else
    echo "[-] FAILED: Authentication check failed. Did not find authenticated session markers."
    exit 1
fi
