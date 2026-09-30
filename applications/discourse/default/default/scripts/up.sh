#!/usr/bin/env bash
set -Eeuo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

docker compose -f docker/compose.yaml up -d

echo "等待 Discourse 服务就绪..."
for i in {1..60}; do
  if bash scripts/healthcheck.sh >/dev/null 2>&1; then
    echo "Discourse default 服务已成功启动并通过健康检查。"
    exit 0
  fi
  sleep 3
done

echo "Discourse default 启动超时。" >&2
exit 1
