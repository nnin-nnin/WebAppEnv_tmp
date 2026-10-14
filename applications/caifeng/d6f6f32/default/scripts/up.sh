#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
docker compose -f "$ENV_DIR/docker/compose.yaml" up -d
for i in $(seq 1 60); do
  if "$SCRIPT_DIR/healthcheck.sh" >/dev/null 2>&1; then
    echo "[+] caifeng is ready on http://127.0.0.1:18101"
    exit 0
  fi
  sleep 2
done
echo "[-] Timed out waiting for caifeng" >&2
exit 1
