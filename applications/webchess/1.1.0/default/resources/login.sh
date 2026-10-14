#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18083}"
BASE_URL="${APP_URL:-${BASE_URL:-http://127.0.0.1:${HOST_PORT}}}"
DB_NAME="${DB_NAME:-webchess}"
ADMIN_USER="${ADMIN_USER:-admin}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

TARGET_USER="${1:-}"
TARGET_PASS="${2:-}"

echo "=================================================="
echo " Webchess Authentication Verification"
echo " Target URL: ${BASE_URL}"
echo "=================================================="

# Check web entrypoint
echo "1. Validating webchess root entrypoint at ${BASE_URL}/..."
ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || echo "000")
if [ "$ROOT_CODE" -ne 200 ] && [ "$ROOT_CODE" -ne 302 ] && [ "$ROOT_CODE" -ne 303 ]; then
    echo "ERROR: Root entrypoint returned unexpected HTTP ${ROOT_CODE} (expected 200/302/303)"
    exit 1
fi

PAGE_CONTENT=$(curl -s -L "${BASE_URL}/" || true)
if ! echo "$PAGE_CONTENT" | grep -qiE "(PHP7-Webchess|Webchess|Login|Main Menu)"; then
    echo "ERROR: Entrypoint content does not match PHP7-Webchess"
    exit 1
fi
echo "SUCCESS: PHP7-Webchess web entrypoint verified."

# Check health.php endpoint
echo "2. Checking health endpoint at ${BASE_URL}/health.php..."
HEALTH_RESP=$(curl -s "${BASE_URL}/health.php" || echo "")
if ! echo "$HEALTH_RESP" | grep -q '"status":"UP"'; then
    echo "ERROR: Healthcheck endpoint returned unexpected response: ${HEALTH_RESP}"
    exit 1
fi
echo "SUCCESS: Webchess health and database connection verified."

# Helper function to test credentials
verify_account_login() {
    local username="$1"
    local password="$2"
    local role_desc="$3"

    local cookie_jar
    local login_res
    cookie_jar="$(mktemp)"
    login_res="$(mktemp)"

    echo "Submitting credentials for ${role_desc} ('${username}')..."
    curl -s -L -c "$cookie_jar" -b "$cookie_jar" -o "$login_res" \
        -X POST "${BASE_URL}/mainmenu.php" \
        -d "txtNick=${username}&pwdPassword=${password}&ToDo=Login&login=Login"

    if grep -qi "Invalid Nick or Password" "$login_res"; then
        echo "ERROR: Login explicitly rejected for '${username}' (Invalid Nick or Password)."
        rm -f "$cookie_jar" "$login_res"
        return 1
    fi

    if ! grep -qiE "(Main Menu|Logout|Current Games|Active Games)" "$login_res"; then
        echo "ERROR: Authentication failed for user '${username}' (session response missing expected markers)."
        head -n 40 "$login_res"
        rm -f "$cookie_jar" "$login_res"
        return 1
    fi

    # Verify session continuity by fetching mainmenu.php again using established cookie
    local menu_res
    menu_res="$(mktemp)"
    curl -s -L -b "$cookie_jar" -o "$menu_res" "${BASE_URL}/mainmenu.php"
    if ! grep -qiE "(Main Menu|Logout)" "$menu_res"; then
        echo "ERROR: Established session cookie verification failed for '${username}'."
        rm -f "$cookie_jar" "$login_res" "$menu_res"
        return 1
    fi
    rm -f "$menu_res"

    rm -f "$cookie_jar" "$login_res"
    echo "SUCCESS: Authenticated and main menu session verified for '${username}'."
    return 0
}

# If single user provided
if [ -n "$TARGET_USER" ] && [ -n "$TARGET_PASS" ]; then
    echo "3. Executing single-account login verification for: ${TARGET_USER}"
    if verify_account_login "$TARGET_USER" "$TARGET_PASS" "Custom Target User"; then
        echo "Single account verification PASSED for '${TARGET_USER}'."
        exit 0
    else
        echo "Single account verification FAILED for '${TARGET_USER}'."
        exit 1
    fi
fi

# Multi-account 4-matrix full verification
echo "3. Executing comprehensive 4-account dual-peer matrix verification..."

declare -a USERS=("admin" "admin2" "user1" "user2")
declare -a PASSES=("AdminPassword123!" "AdminPassword123!" "UserPassword123!" "UserPassword123!")
declare -a DESCS=(
    "Primary Administrator (vertical_admin)"
    "Secondary Administrator (horizontal_admin)"
    "Standard Business User A (horizontal_user)"
    "Standard Business User B (horizontal_user)"
)

ALL_PASSED=true
for i in "${!USERS[@]}"; do
    u="${USERS[$i]}"
    p="${PASSES[$i]}"
    d="${DESCS[$i]}"
    echo "--------------------------------------------------"
    if ! verify_account_login "$u" "$p" "$d"; then
        ALL_PASSED=false
        echo "FAILED account: ${u}"
    fi
done

if [ "$ALL_PASSED" != "true" ]; then
    echo "ERROR: One or more matrix accounts failed authentication!"
    exit 1
fi

echo "--------------------------------------------------"
echo "4. Testing negative authentication (false-positive prevention)..."
BAD_LOGIN_RES="$(mktemp)"
curl -s -L -o "$BAD_LOGIN_RES" \
    -X POST "${BASE_URL}/mainmenu.php" \
    -d "txtNick=admin&pwdPassword=WrongPassword999!&ToDo=Login&login=Login"

if grep -qiE "(Main Menu|Logout|Current Games)" "$BAD_LOGIN_RES" && ! grep -qi "Invalid Nick or Password" "$BAD_LOGIN_RES"; then
    echo "ERROR: False-positive detected! Invalid login was mistakenly accepted."
    rm -f "$BAD_LOGIN_RES"
    exit 1
fi
rm -f "$BAD_LOGIN_RES"
echo "SUCCESS: Invalid credentials correctly rejected with security alert."

echo "=================================================="
echo "All 4 matrix accounts verified successfully! (admin, admin2, user1, user2)"
echo "Negative authentication test PASSED."
echo "=================================================="
exit 0
