#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18874}"
BASE_URL="${APP_URL:-${BASE_URL:-http://127.0.0.1:${HOST_PORT}}}"
USERNAME="${1:-${ADMIN_USERNAME:-admin}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-AdminPassword123!}}"

COOKIE_JAR="$(mktemp)"
LOGIN_RES="$(mktemp)"
trap 'rm -f "$COOKIE_JAR" "$LOGIN_RES"' EXIT

echo "Validating webchess entrypoint at ${BASE_URL}/..."
ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || echo "000")
if [ "$ROOT_CODE" -ne 200 ]; then
    echo "ERROR: Root entrypoint returned HTTP ${ROOT_CODE} (expected 200)"
    exit 1
fi

PAGE_CONTENT=$(curl -s "${BASE_URL}/" || true)
if ! echo "$PAGE_CONTENT" | grep -qiE "(PHP7-Webchess|Webchess|Login)"; then
    echo "ERROR: Entrypoint content does not match PHP7-Webchess"
    exit 1
fi
echo "SUCCESS: PHP7-Webchess web entrypoint verified."

echo "Checking health endpoint at ${BASE_URL}/health.php..."
HEALTH_RESP=$(curl -s "${BASE_URL}/health.php" || echo "")
if ! echo "$HEALTH_RESP" | grep -q '"status":"UP"'; then
    echo "ERROR: Healthcheck endpoint returned unexpected response: ${HEALTH_RESP}"
    exit 1
fi
echo "SUCCESS: Webchess health and database connection verified."

echo "Submitting credentials for user: ${USERNAME}..."
curl -s -L -c "$COOKIE_JAR" -b "$COOKIE_JAR" -o "$LOGIN_RES" \
    -X POST "${BASE_URL}/mainmenu.php" \
    -d "txtNick=${USERNAME}&pwdPassword=${PASSWORD}&ToDo=Login&login=Login"

if ! grep -qiE "(Main Menu|Logout|Current Games)" "$LOGIN_RES"; then
    echo "ERROR: Authentication failed for user '${USERNAME}'"
    head -n 40 "$LOGIN_RES"
    exit 1
fi
echo "SUCCESS: Authenticated and main menu session verified for user '${USERNAME}'."

echo "Testing negative authentication (false-positive prevention)..."
BAD_LOGIN_RES="$(mktemp)"
curl -s -L -o "$BAD_LOGIN_RES" \
    -X POST "${BASE_URL}/mainmenu.php" \
    -d "txtNick=${USERNAME}&pwdPassword=WrongPassword999&ToDo=Login&login=Login"

if grep -qiE "(Main Menu|Current Games)" "$BAD_LOGIN_RES" && ! grep -qi "Invalid Nick or Password" "$BAD_LOGIN_RES"; then
    echo "ERROR: False-positive detected! Invalid login was mistakenly accepted"
    rm -f "$BAD_LOGIN_RES"
    exit 1
fi
rm -f "$BAD_LOGIN_RES"
echo "SUCCESS: Invalid credentials correctly rejected."

echo "All login verifications passed successfully."
exit 0
