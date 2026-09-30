#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18772}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking Apache Tomcat entrypoint at ${BASE_URL}/..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: Tomcat root entrypoint returned HTTP ${HTTP_CODE}, expected 200"
    exit 1
fi
echo "SUCCESS: Tomcat root entrypoint is accessible (HTTP 200)"

echo "Checking Tomcat Manager endpoint at ${BASE_URL}/manager/html..."
MGR_CODE=$(curl -s -o /dev/null -w "%{http_code}" -u tomcat:tomcat "${BASE_URL}/manager/html" || true)

if [ "$MGR_CODE" -eq 200 ]; then
    echo "SUCCESS: Tomcat Manager GUI is accessible with credentials (HTTP 200)"
elif [ "$MGR_CODE" -eq 401 ]; then
    echo "NOTICE: Tomcat Manager endpoint returned HTTP 401 (Basic Authentication challenged)"
fi

exit 0
