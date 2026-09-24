#!/bin/bash
set -euo pipefail

PORT="${SPRINGBLADE_PORT:-18090}"
echo "Waiting for SpringBlade frontend and backend services..."
ready=0
for i in {1..30}; do
  if curl -fsS "http://127.0.0.1:${PORT}/" >/dev/null 2>&1; then
    code=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${PORT}/api/blade-auth/token" 2>/dev/null || true)
    if [ "$code" != "502" ] && [ "$code" != "000" ] && [ "$code" != "" ]; then
      ready=1
      break
    fi
  fi
  sleep 2
done

if [ "$ready" -ne 1 ]; then
  echo "Backend API not ready (code: ${code:-none})"
  exit 1
fi

echo "Healthcheck passed"
