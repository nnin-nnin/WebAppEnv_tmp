#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "Checking compose config..."
docker compose -f docker/compose.yaml config --quiet

echo "Checking service status..."
if ! docker compose -f docker/compose.yaml ps --status running --services | grep -q .; then
  echo "No services are running."
  exit 1
fi

echo "Checking HTTP endpoint..."
if ! curl -s -f http://localhost:28089 > /dev/null; then
  echo "Application HTTP endpoint is not responding."
  exit 1
fi

echo "Healthcheck passed."
