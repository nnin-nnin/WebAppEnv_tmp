#!/usr/bin/env bash
set -euo pipefail
code=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:18094/ site) || true
code=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:18094/blogs?pageNum=1)
if [[ "$code" == "200" ]]; then
  echo "[OK] NBlog healthcheck passed (HTTP $code)"
  exit 0
fi
echo "[ERR] NBlog healthcheck failed (HTTP $code)"
exit 1
