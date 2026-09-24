#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="18010"

echo "=== 执行 Apache Airflow 健康检查 ==="

# 1. 检查 Compose 配置文件有效性
if ! docker compose -f "${COMPOSE_FILE}" config --quiet; then
    echo "[FAIL] Compose 配置文件校验失败"
    exit 1
fi
echo "[OK] Compose 配置文件正确"

# 2. 检查必需容器运行状态
REQUIRED_SERVICES=("postgres" "redis" "airflow-apiserver" "airflow-scheduler" "airflow-worker")
for svc in "${REQUIRED_SERVICES[@]}"; do
    CONTAINER_STATE=$(docker compose -f "${COMPOSE_FILE}" ps --format "{{.State}}" "${svc}" 2>/dev/null || true)
    if [[ "${CONTAINER_STATE}" != "running" ]]; then
        echo "[FAIL] 服务 ${svc} 处于非运行状态: ${CONTAINER_STATE:-不存在}"
        exit 1
    fi
    echo "[OK] 服务 ${svc} 状态: running"
done

# 3. 检查 Web UI / API HTTP 入口 (端口 18010)
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/api/v2/monitor/health" 2>/dev/null || true)
if [[ "${HTTP_CODE}" != "200" ]]; then
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/" 2>/dev/null || true)
fi

if [[ "${HTTP_CODE}" == "200" || "${HTTP_CODE}" == "302" ]]; then
    echo "[OK] Web UI HTTP 响应成功 (HTTP ${HTTP_CODE})"
else
    echo "[FAIL] Web UI HTTP 响应异常 (HTTP ${HTTP_CODE:-000})"
    exit 1
fi

echo "[SUCCESS] 所有健康检查通过！"
exit 0
