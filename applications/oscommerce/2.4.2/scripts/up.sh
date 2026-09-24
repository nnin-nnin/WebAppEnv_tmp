#!/usr/bin/env bash
set -Eeuo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

docker compose -f docker/compose.yaml up -d

# Wait for service to be healthy
for i in {1..30}; do
  if bash scripts/healthcheck.sh >/dev/null 2>&1; then
    echo "osCommerce 2.4.2 服务已成功启动并通过健康检查。"
    exit 0
  fi
  sleep 2
done

echo "osCommerce 启动超时。" >&2
exit 1
