#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "[up] Starting hotel environment..."
docker compose -f "$ENV_DIR/docker/compose.yaml" up -d

echo "[up] Waiting for hotel service to become ready on http://127.0.0.1:18089/ho-api/ ..."
for i in $(seq 1 60); do
  if "$SCRIPT_DIR/healthcheck.sh" >/dev/null 2>&1; then
    echo "[up] Hotel service is ready!"
    exit 0
  fi
  sleep 2
done

echo "[up] ERROR: Service did not become ready in time." >&2
exit 1
