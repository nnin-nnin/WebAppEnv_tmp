#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOST_PORT="${HOST_PORT:-18871}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

echo "[Trac] Testing authentication at ${BASE_URL}..."

# Step 1: Check login endpoint accessibility (unauthenticated gives 401)
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login" || true)
if [ "$HTTP_CODE" -ne 401 ] && [ "$HTTP_CODE" -ne 200 ]; then
  echo "[Trac] ERROR: Login endpoint ${BASE_URL}/login returned unexpected HTTP ${HTTP_CODE} (expected 401 or 200)"
  exit 1
fi
echo "[Trac] Login endpoint accessible (HTTP ${HTTP_CODE})."

# Step 2: Perform HTTP Basic Authentication against /login
TEMP_COOKIE=$(mktemp)
trap 'rm -f "$TEMP_COOKIE"' EXIT

LOGIN_HEADER=$(curl -s -i -u "${USERNAME}:${PASSWORD}" -c "$TEMP_COOKIE" "${BASE_URL}/login" || true)
HTTP_STATUS=$(echo "$LOGIN_HEADER" | head -n 1 | awk '{print $2}')

if [ "$HTTP_STATUS" != "302" ] && [ "$HTTP_STATUS" != "200" ]; then
  echo "[Trac] ERROR: Authentication failed with HTTP status ${HTTP_STATUS}"
  exit 1
fi

# Step 3: Verify authenticated session content
AUTH_BODY=$(curl -s -L -b "$TEMP_COOKIE" -u "${USERNAME}:${PASSWORD}" "${BASE_URL}/login" || true)
if echo "$AUTH_BODY" | grep -qiE "(logged in as.*${USERNAME}|<span class=\"trac-author-user\">${USERNAME}</span>)"; then
  echo "[Trac] Successfully authenticated as '${USERNAME}'."
  echo "[Trac] Login check PASSED."
  exit 0
else
  echo "[Trac] ERROR: Authenticated session content did not match expected user '${USERNAME}'"
  exit 1
fi
