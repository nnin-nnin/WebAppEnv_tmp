#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"

echo "=== 重置 Apache Airflow Compose 环境 ==="
echo "清理容器、网络及命名数据卷..."

if [[ -f "${COMPOSE_FILE}" ]]; then
    docker compose -f "${COMPOSE_FILE}" down -v --remove-orphans
    echo "[SUCCESS] 环境重置完成！"
else
    echo "[ERROR] 未找到 ${COMPOSE_FILE}"
    exit 1
fi
