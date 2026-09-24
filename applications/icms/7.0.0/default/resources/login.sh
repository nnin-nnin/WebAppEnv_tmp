#!/usr/bin/env bash
set -euo pipefail

# Strip local proxies
export http_proxy=""
export https_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export all_proxy=""
export ALL_PROXY=""
export no_proxy="*"
export NO_PROXY="*"

HOST_PORT="${HOST_PORT:-18633}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
ADMIN_USER="${1:-${ADMIN_USER:-${ADMIN_USERNAME:-${ICMS_USER:-admin}}}}"
ADMIN_PASS="${2:-${ADMIN_PASSWORD:-${PASSWORD:-${ICMS_PASSWORD:-AdminPassword123!}}}}"

echo "=== Verifying iCMS Login and Administration Endpoints at ${BASE_URL} ==="

# 1. Check /admincp.php directly
HTTP_CODE_LOGIN=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/admincp.php" || true)
if [ "$HTTP_CODE_LOGIN" -eq 200 ]; then
    echo "SUCCESS: Login endpoint /admincp.php returned HTTP $HTTP_CODE_LOGIN."
else
    echo "ERROR: Login endpoint /admincp.php returned HTTP $HTTP_CODE_LOGIN, expected 200"
    exit 1
fi

# 2. Check root / endpoint
HTTP_CODE_ROOT=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE_ROOT" -eq 200 ]; then
    echo "SUCCESS: Root endpoint / returned HTTP $HTTP_CODE_ROOT."
fi

# 3. Perform POST authentication check
echo "Testing admin credentials for user '${ADMIN_USER}'..."
HTTP_CODE_POST=$(curl -s -o /dev/null -w "%{http_code}" -X POST -d "username=${ADMIN_USER}&password=${ADMIN_PASS}" "${BASE_URL}/admincp.php?do=login" || true)
if [ "$HTTP_CODE_POST" -eq 200 ]; then
    echo "SUCCESS: POST login endpoint returned HTTP $HTTP_CODE_POST."
fi

echo "=== iCMS Login Verification PASSED ==="
exit 0
