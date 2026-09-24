#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://localhost:18010}"
USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-benchmark-only}"

COOKIE_FILE=$(mktemp)
trap 'rm -f "${COOKIE_FILE}"' EXIT

echo "=== 尝试登录 Apache Airflow Web UI ==="
echo "Target URL: ${APP_URL}"
echo "Username: ${USERNAME}"

# 1. 尝试 REST API 鉴权或 health Check 探针
HEALTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/api/v2/monitor/health" 2>/dev/null || true)
if [[ "${HEALTH_CODE}" != "200" ]]; then
    # 尝试旧版本 API / 探针
    HEALTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/health" 2>/dev/null || true)
fi

echo "API Health Check status: ${HEALTH_CODE}"

# 2. 访问登录页面以获取 Cookie 和 CSRF Token（如果是 FAB 管理界面）
LOGIN_PAGE=$(curl -s -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" "${APP_URL}/auth/login/" 2>/dev/null || curl -s -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" "${APP_URL}/login/" 2>/dev/null || true)

CSRF_TOKEN=$(echo "${LOGIN_PAGE}" | grep -o 'name="csrf_token" type="hidden" value="[^"]*"' | sed 's/.*value="//;s/"//' || true)

if [[ -n "${CSRF_TOKEN}" ]]; then
    echo "获取到 CSRF Token，提交 HTML 表单登录..."
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -X POST \
        -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
        -d "username=${USERNAME}" \
        -d "password=${PASSWORD}" \
        -d "csrf_token=${CSRF_TOKEN}" \
        "${APP_URL}/auth/login/" 2>/dev/null || true)
else
    echo "未检测到 CSRF Token，尝试直接 POST 鉴权..."
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -X POST \
        -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
        -d "username=${USERNAME}" \
        -d "password=${PASSWORD}" \
        "${APP_URL}/login/" 2>/dev/null || true)
fi

# 检查登录后的首页或 API 响应
HOME_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "${COOKIE_FILE}" "${APP_URL}/home" 2>/dev/null || curl -s -o /dev/null -w "%{http_code}" -b "${COOKIE_FILE}" "${APP_URL}/" 2>/dev/null || true)

if [[ "${HOME_CODE}" == "200" || "${HOME_CODE}" == "302" || "${HTTP_CODE}" == "200" || "${HTTP_CODE}" == "302" ]]; then
    echo "[SUCCESS] Airflow 登录成功! (HTTP ${HOME_CODE})"
    exit 0
else
    echo "[ERROR] Airflow 登录失败! (HTTP Login: ${HTTP_CODE}, Home: ${HOME_CODE})"
    exit 1
fi
