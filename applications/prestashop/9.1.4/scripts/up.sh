#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for PrestaShop to become healthy..."
max_retries=45
counter=0
until bash "$SCRIPT_DIR/healthcheck.sh" >/dev/null 2>&1; do
  counter=$((counter + 1))
  if [ "$counter" -ge "$max_retries" ]; then
    echo "PrestaShop failed to become healthy after $max_retries retries" >&2
    bash "$SCRIPT_DIR/healthcheck.sh" || true
    exit 1
  fi
  sleep 3
done

echo "PrestaShop is up and healthy."
