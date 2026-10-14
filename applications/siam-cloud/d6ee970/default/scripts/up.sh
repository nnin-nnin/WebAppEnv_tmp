#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_DIR="$(dirname "$SCRIPT_DIR")"
docker compose -f "$ENV_DIR/docker/compose.yaml" up -d
echo "Waiting for siam-cloud on http://127.0.0.1:18099 ..."
for i in $(seq 1 90); do
  code=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:18099/swagger-ui.html || true)
  if [ "$code" = "200" ]; then
    echo "siam-cloud is ready (HTTP $code)."
    exit 0
  fi
  sleep 2
done
echo "Timeout waiting for siam-cloud" >&2
exit 1
