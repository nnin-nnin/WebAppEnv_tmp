#!/usr/bin/env bash
set -euo pipefail
code=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:18099/swagger-ui.html || true)
if [ "$code" = "200" ]; then
  echo "Healthcheck passed (HTTP $code)"
  exit 0
fi
echo "Healthcheck failed (HTTP $code)" >&2
exit 1
