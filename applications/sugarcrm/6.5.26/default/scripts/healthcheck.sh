#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${SUGARCRM_PORT:-18629}"
URL="http://127.0.0.1:${HOST_PORT}/index.php?action=Login&module=Users"

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL" 2>/dev/null || true)
if [ "$HTTP_CODE" != "200" ]; then
    HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" 2>/dev/null || true)
fi

if [ "$HTTP_CODE" = "200" ]; then
    echo "SUCCESS: SugarCRM returned HTTP $HTTP_CODE"
    exit 0
else
    echo "FAILED: SugarCRM returned HTTP $HTTP_CODE"
    exit 1
fi
