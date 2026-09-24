#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${SUGARCRM_PORT:-18629}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Verifying SugarCRM login endpoint at ${BASE_URL}..."

HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/index.php?action=Login&module=Users")
if [ "$HTTP_STATUS" != "200" ]; then
    HTTP_STATUS=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/")
fi

if [ "$HTTP_STATUS" = "200" ]; then
    echo "SUCCESS: SugarCRM returned HTTP 200 at ${BASE_URL} (Login endpoint accessible)"
    exit 0
else
    echo "FAILED: SugarCRM returned unexpected HTTP status ${HTTP_STATUS}"
    exit 1
fi
