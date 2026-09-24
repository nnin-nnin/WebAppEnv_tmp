#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${APP_DIR}"

docker compose -f docker/compose.yaml up -d

echo "等待 MintHCM 服务就绪..."
for i in $(seq 1 60); do
  if bash "${APP_DIR}/scripts/healthcheck.sh" >/dev/null 2>&1; then
    echo "MintHCM 服务已就绪 (第 $i 次检查成功)"
    exit 0
  fi
  sleep 3
done

echo "MintHCM 未能在限定时间内就绪" >&2
bash "${APP_DIR}/scripts/healthcheck.sh" || true
exit 1
