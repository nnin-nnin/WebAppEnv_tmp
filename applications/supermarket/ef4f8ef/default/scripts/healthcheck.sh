#!/usr/bin/env bash
set -euo pipefail
code=$(curl -s -o /dev/null -w "%{http_code}" -X POST http://127.0.0.1:18098/manage/checkUserName -d "userName=admin" || true)
if [[ "$code" == "200" ]]; then
  echo "[OK] SuperMarket healthcheck passed (HTTP $code)"
  exit 0
fi
exit 1
