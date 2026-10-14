#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18085}"
BASE_URL="${APP_URL:-${BASE_URL:-http://127.0.0.1:${HOST_PORT}}}"

test_user_login() {
    local USERNAME="$1"
    local PASSWORD="$2"
    local ROLE="$3"
    
    local COOKIE_JAR="$(mktemp)"
    local LOGIN_RES="$(mktemp)"
    
    echo "=================================================="
    echo "Testing login for [${ROLE}]: ${USERNAME}"
    echo "=================================================="
    
    # Prime session if needed
    curl -s -c "$COOKIE_JAR" -b "$COOKIE_JAR" "${BASE_URL}/geetestInit" > /dev/null 2>&1 || true
    
    # Submit login
    local LOGIN_RESP=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
        -X POST "${BASE_URL}/user/login" \
        -d "username=${USERNAME}&password=${PASSWORD}&challenge=&validate=&seccode=")
    
    if ! echo "$LOGIN_RESP" | grep -qiE '("success"\s*:\s*true|"status"\s*:\s*200|"code"\s*:\s*200)'; then
        LOGIN_RESP=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
            -X POST "${BASE_URL}/user/login" \
            -d "username=${USERNAME}&password=${PASSWORD}&challenge=1&validate=1&seccode=1")
    fi
    
    echo "Login response: ${LOGIN_RESP}"
    if ! echo "$LOGIN_RESP" | grep -qiE '("success"\s*:\s*true|"status"\s*:\s*200|"code"\s*:\s*200)'; then
        echo "ERROR: Authentication FAILED for user '${USERNAME}'"
        rm -f "$COOKIE_JAR" "$LOGIN_RES"
        return 1
    fi
    
    # Verify session
    local USER_INFO=$(curl -s -b "$COOKIE_JAR" "${BASE_URL}/user/userInfo")
    echo "User info response: ${USER_INFO}"
    if ! echo "$USER_INFO" | grep -qiE "\"username\"\s*:\s*\"${USERNAME}\""; then
        echo "ERROR: Session identity mismatch for user '${USERNAME}'"
        rm -f "$COOKIE_JAR" "$LOGIN_RES"
        return 1
    fi
    echo "SUCCESS: Authenticated session confirmed for [${ROLE}] ${USERNAME}."
    
    # Negative test
    local BAD_COOKIE="$(mktemp)"
    local BAD_RESP=$(curl -s -b "$BAD_COOKIE" -c "$BAD_COOKIE" \
        -X POST "${BASE_URL}/user/login" \
        -d "username=${USERNAME}&password=WrongPassword999!&challenge=&validate=&seccode=")
    rm -f "$BAD_COOKIE"
    if echo "$BAD_RESP" | grep -qiE '("success"\s*:\s*true|"status"\s*:\s*200|"code"\s*:\s*200)'; then
        echo "ERROR: False-positive accepted wrong password for '${USERNAME}'!"
        rm -f "$COOKIE_JAR" "$LOGIN_RES"
        return 1
    fi
    echo "SUCCESS: Bad password correctly rejected for ${USERNAME}."
    
    rm -f "$COOKIE_JAR" "$LOGIN_RES"
    return 0
}

echo "Validating XMall entrypoint at ${BASE_URL}/..."
ROOT_CODE="000"
for attempt in {1..20}; do
    RAW_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 "${BASE_URL}/" 2>/dev/null || true)
    if [ -n "$RAW_CODE" ]; then
        ROOT_CODE="${RAW_CODE: -3}"
        if [ "$ROOT_CODE" -eq 200 ] || [ "$ROOT_CODE" -eq 302 ]; then
            break
        fi
    fi
    sleep 2
done

if [ "$ROOT_CODE" -ne 200 ] && [ "$ROOT_CODE" -ne 302 ]; then
    echo "ERROR: XMall root entrypoint returned HTTP ${ROOT_CODE} (expected 200 or 302)"
    exit 1
fi
echo "SUCCESS: XMall entrypoint reachable (HTTP ${ROOT_CODE})."

if [ $# -ge 2 ]; then
    # Custom single user test
    test_user_login "$1" "$2" "Custom User"
else
    # Full 4-account dual-tier matrix verification
    echo "Starting full 4-account dual-matrix validation..."
    test_user_login "admin" "AdminPassword123!" "Admin (Vertical Primary)"
    test_user_login "admin2" "AdminPassword123!" "Admin (Horizontal Secondary)"
    test_user_login "user1" "UserPassword123!" "Standard User (Horizontal A)"
    test_user_login "user2" "UserPassword123!" "Standard User (Horizontal B)"
fi

echo "=================================================="
echo "ALL XMALL ACCOUNTS SUCCESSFULLY VALIDATED!"
echo "=================================================="
exit 0
