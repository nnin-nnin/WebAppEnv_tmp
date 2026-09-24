#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18554}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${USERNAME:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

echo "Testing login for ProcessWire at ${BASE_URL} with user ${USERNAME}..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

LOGIN_PAGE="${BASE_URL}/processwire/"
HTTP_CODE=$(curl -s -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/login.html" -w "%{http_code}" "$LOGIN_PAGE")

if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 400 ]; then
    echo "FAILED: Login page unreachable (HTTP $HTTP_CODE)"
    exit 1
fi

TOKEN_NAME=$(grep -o 'name=["'\'']TOKEN[^"'\'']*' "$TMP_DIR/login.html" | head -1 | sed 's/name=["'\'']//')
TOKEN_VALUE=$(grep -o "name=[\"']$TOKEN_NAME[\"'][^>]*" "$TMP_DIR/login.html" | sed 's/.*value=["'\'']//;s/["'\''].*//')
if [ -z "$TOKEN_VALUE" ]; then
    TOKEN_VALUE=$(grep -o 'class=["'\''][^"'\'']*_post_token[^"'\'']*' -B 2 -A 2 "$TMP_DIR/login.html" | grep -o 'value=["'\''][^"'\'']*' | head -1 | sed 's/value=["'\'']//')
fi
LOGIN_START=$(grep -o 'name=["'\'']login_start["'\''][^>]*' "$TMP_DIR/login.html" | sed 's/.*value=["'\'']//;s/["'\''].*//')

if [ -z "$TOKEN_NAME" ] || [ -z "$TOKEN_VALUE" ]; then
    # Fallback to python parser if simple sed didn't catch the token
    read -r TOKEN_NAME TOKEN_VALUE LOGIN_START <<< $(python3 -c '
import re, sys
try:
    with open("'"$TMP_DIR"'/login.html", encoding="utf-8", errors="ignore") as f:
        html = f.read()
    m = re.search(r"name=[\x27\"](TOKEN[^\x27\"]+)[\x27\"]\s+value=[\x27\"]([^\x27\"]+)[\x27\"]", html)
    if not m:
        m = re.search(r"value=[\x27\"]([^\x27\"]+)[\x27\"][^>]*name=[\x27\"](TOKEN[^\x27\"]+)[\x27\"]", html)
        t_name, t_val = (m.group(2), m.group(1)) if m else ("", "")
    else:
        t_name, t_val = m.group(1), m.group(2)
    m2 = re.search(r"name=[\x27\"]login_start[\x27\"]\s+value=[\x27\"]([^\x27\"]+)[\x27\"]", html)
    l_start = m2.group(1) if m2 else ""
    print(f"{t_name} {t_val} {l_start}")
except Exception:
    pass
' 2>/dev/null || true)
fi

if [ -z "$TOKEN_NAME" ] || [ -z "$TOKEN_VALUE" ]; then
    echo "FAILED: Could not extract CSRF token"
    exit 1
fi

RESP_CODE=$(curl -s -L -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/dashboard.html" -w "%{http_code}" \
    --data-urlencode "login_name=${USERNAME}" \
    --data-urlencode "login_pass=${PASSWORD}" \
    --data-urlencode "login_submit=Login" \
    --data-urlencode "login_start=${LOGIN_START:-1790164771}" \
    --data-urlencode "login_hidpi=0" \
    --data-urlencode "login_touch=0" \
    --data-urlencode "login_width=1920" \
    --data-urlencode "_InputfieldForm=ProcessLoginForm" \
    --data-urlencode "${TOKEN_NAME}=${TOKEN_VALUE}" \
    "${LOGIN_PAGE}")

if [ "$RESP_CODE" -eq 200 ] && grep -qiE "(logout|logged in as|pw-masthead)" "$TMP_DIR/dashboard.html"; then
    echo "SUCCESS: Successfully authenticated as ${USERNAME} (HTTP $RESP_CODE)"
    exit 0
fi

echo "FAILED: Authentication failed for ${USERNAME} (HTTP $RESP_CODE)"
exit 1
