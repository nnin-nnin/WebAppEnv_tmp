#!/usr/bin/env bash
set -euo pipefail
code=$(curl -s -o /dev/null -w "%{http_code}" -X POST http://127.0.0.1:18093/verifyCode)
if [[ "$code" == "200" ]]; then
  echo "[OK] Tbed healthcheck passed (HTTP $code)"
  exit 0
fi
echo "[ERR] Tbed healthcheck failed (HTTP $code)"
exit 1
