#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="18010"

echo "=== 启动 Apache Airflow (Native Docker Compose) ==="
echo "应用目录: ${APP_DIR}"
echo "Compose 文件: ${COMPOSE_FILE}"

if [[ ! -f "${COMPOSE_FILE}" ]]; then
    echo "[ERROR] 未找到 Docker Compose 配置文件: ${COMPOSE_FILE}"
    exit 1
fi

echo "1. 校验 Docker Compose 配置..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "2. 启动 Docker Compose 容器集群..."
docker compose -f "${COMPOSE_FILE}" up -d

echo "3. 等待必需服务准备完成与健康检查 (最多等待 180 秒)..."
MAX_ATTEMPTS=36
SLEEP_INTERVAL=5
SUCCESS=false

for ((i=1; i<=MAX_ATTEMPTS; i++)); do
    echo "检查进度 ($i/$MAX_ATTEMPTS)..."
    
    # 检查 HTTP 端口响应
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/api/v2/monitor/health" 2>/dev/null || curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/" 2>/dev/null || true)
    
    if [[ "${HTTP_STATUS}" == "200" || "${HTTP_STATUS}" == "302" ]]; then
        echo "[SUCCESS] Airflow Web UI / API 已就绪 (HTTP Status: ${HTTP_STATUS})"
        SUCCESS=true
        break
    fi
    
    sleep "${SLEEP_INTERVAL}"
done

if [[ "${SUCCESS}" == "true" ]]; then
    echo "=== 服务运行状态 ==="
    docker compose -f "${COMPOSE_FILE}" ps
    exit 0
else
    echo "[ERROR] 服务启动超时 (180s)，输出容器状态及日志摘要："
    docker compose -f "${COMPOSE_FILE}" ps
    docker compose -f "${COMPOSE_FILE}" logs --tail 50
    exit 1
fi
