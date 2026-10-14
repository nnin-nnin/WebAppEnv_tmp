#!/usr/bin/env bash
set -euo pipefail
URL="${1:-http://127.0.0.1:18091/toIndex.do}"
CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL" || true)
if [[ "$CODE" == "200" ]]; then
  echo "[healthcheck] OK ($URL -> HTTP $CODE)"
  exit 0
fi
echo "[healthcheck] FAIL ($URL -> HTTP $CODE)" >&2
exit 1
