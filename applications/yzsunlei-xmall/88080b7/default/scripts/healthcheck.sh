#!/usr/bin/env bash
set -euo pipefail
code=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:18097/swagger-ui.html || true)
if [[ "$code" == "200" || "$code" == "302" ]]; then
  echo "[OK] yzsunlei-xmall healthcheck passed (HTTP $code)"
  exit 0
fi
exit 1
