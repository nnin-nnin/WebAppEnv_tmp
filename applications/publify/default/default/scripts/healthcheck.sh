#!/usr/bin/env bash
set -euo pipefail

TARGET_HOST="${PUBLIFY_HOST:-127.0.0.1}"
TARGET_PORT="${PUBLIFY_PORT:-18861}"
URL="http://${TARGET_HOST}:${TARGET_PORT}/"

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout 5 --max-time 10 "${URL}" || echo "000")

echo "[*] Checking Publify health at ${URL} -> HTTP ${HTTP_CODE}"

if [ "${HTTP_CODE}" = "200" ] || [ "${HTTP_CODE}" = "302" ]; then
  echo "[+] Healthcheck PASSED"
  exit 0
else
  echo "[-] Healthcheck FAILED (expected 200 or 302, got ${HTTP_CODE})"
  exit 1
fi
