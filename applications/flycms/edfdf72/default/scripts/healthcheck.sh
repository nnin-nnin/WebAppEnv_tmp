#!/usr/bin/env bash
set -euo pipefail
code=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:18095/login)
if [[ "$code" == "200" || "$code" == "302" ]]; then
  echo "[OK] FlyCms healthcheck passed (HTTP $code)"
  exit 0
fi
echo "[ERR] FlyCms healthcheck failed (HTTP $code)"
exit 1
