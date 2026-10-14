#!/usr/bin/env bash
set -euo pipefail
code=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:18092/login.action)
if [[ "$code" == "200" || "$code" == "302" ]]; then
  echo "[OK] ssm-demo healthcheck passed (HTTP $code)"
  exit 0
fi
echo "[ERR] ssm-demo healthcheck failed (HTTP $code)"
exit 1
