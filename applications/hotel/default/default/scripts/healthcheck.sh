#!/usr/bin/env bash
set -euo pipefail
URL="${1:-http://127.0.0.1:18089/ho-api/hotel}"
RESP=$(curl -s "$URL" || true)
if echo "$RESP" | grep -q '"code":1000'; then
  echo "[healthcheck] OK ($URL returned code 1000)"
  exit 0
fi
echo "[healthcheck] FAIL ($URL returned: $RESP)" >&2
exit 1
