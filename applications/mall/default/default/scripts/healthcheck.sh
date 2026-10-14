#!/usr/bin/env bash
set -euo pipefail
code=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:18096/v3/api-docs || true)
if [[ "$code" == "200" || "$code" == "302" ]]; then
  echo "[OK] mall healthcheck passed (HTTP $code)"
  exit 0
fi
exit 1
