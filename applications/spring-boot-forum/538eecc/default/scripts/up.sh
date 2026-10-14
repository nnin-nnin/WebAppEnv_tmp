#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "[up] Starting spring-boot-forum environment..."
docker compose -f "$ENV_DIR/docker/compose.yaml" up -d

echo "[up] Waiting for spring-boot-forum service on http://127.0.0.1:18090 ..."
for i in $(seq 1 60); do
  if "$SCRIPT_DIR/healthcheck.sh" >/dev/null 2>&1; then
    echo "[up] spring-boot-forum service is ready!"
    exit 0
  fi
  sleep 2
done

echo "[up] ERROR: Service did not become ready in time." >&2
exit 1
