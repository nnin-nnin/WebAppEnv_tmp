#!/usr/bin/env bash
set -euo pipefail

NEW_USERNAME="${1:-testuser}"
NEW_PASSWORD="${2:-testpass123}"
NEW_EMAIL="${3:-testuser@example.com}"
NEW_ROLE="${4:-User}"
FIRST_NAME="${5:-Test}"
LAST_NAME="${6:-User}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPOSE_FILE="${SCRIPT_DIR}/../docker/compose.yaml"

echo "=== 创建新用户: ${NEW_USERNAME} (${NEW_ROLE}) ==="

if [[ -f "${COMPOSE_FILE}" ]]; then
    echo "使用 Airflow CLI 命令在容器内创建用户..."
    docker compose -f "${COMPOSE_FILE}" exec -T airflow-scheduler airflow users create \
        --username "${NEW_USERNAME}" \
        --password "${NEW_PASSWORD}" \
        --firstname "${FIRST_NAME}" \
        --lastname "${LAST_NAME}" \
        --email "${NEW_EMAIL}" \
        --role "${NEW_ROLE}" || \
    docker compose -f "${COMPOSE_FILE}" exec -T airflow-apiserver airflow users create \
        --username "${NEW_USERNAME}" \
        --password "${NEW_PASSWORD}" \
        --firstname "${FIRST_NAME}" \
        --lastname "${LAST_NAME}" \
        --email "${NEW_EMAIL}" \
        --role "${NEW_ROLE}"

    echo "[SUCCESS] 用户 ${NEW_USERNAME} 创建成功！"
    exit 0
else
    echo "[ERROR] 未找到 docker/compose.yaml 配置文件"
    exit 1
fi
