#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18001}"
URL="http://localhost:${HOST_PORT}/index.php?rt=account/create"

echo "Testing user registration endpoint at http://localhost:${HOST_PORT}..."
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$HTTP_STATUS" -eq 200 ] || [ "$HTTP_STATUS" -eq 302 ]; then
    echo "SUCCESS: Customer registration page accessible (HTTP $HTTP_STATUS)!"
    exit 0
else
    echo "FAILED: Customer registration page returned HTTP $HTTP_STATUS"
    exit 1
fi
