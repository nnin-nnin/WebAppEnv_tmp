#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18607}"
BASE_URL="${APP_URL:-http://localhost:${HOST_PORT}}"

echo "[*] Checking SonarQube health at ${BASE_URL}/api/system/status..."
STATUS=$(curl -s "${BASE_URL}/api/system/status" 2>/dev/null | grep -o '"status":"[^"]*"' | cut -d'"' -f4 || true)

if [ "$STATUS" = "UP" ]; then
  echo "[+] SonarQube healthcheck PASSED: status is UP"
  exit 0
else
  echo "[-] SonarQube healthcheck FAILED: status is '${STATUS}'"
  exit 1
fi
