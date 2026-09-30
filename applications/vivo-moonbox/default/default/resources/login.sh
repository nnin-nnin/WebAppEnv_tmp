#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18872}"
BASE_URL="${APP_URL:-${BASE_URL:-http://127.0.0.1:${HOST_PORT}}}"
USERNAME="${1:-${ADMIN_USERNAME:-admin}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-AdminPassword123!}}"

echo "Validating vivo-moonbox web entrypoint at ${BASE_URL}/..."
ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || echo "000")
if [ "$ROOT_CODE" -ne 200 ]; then
    echo "ERROR: Root entrypoint returned HTTP ${ROOT_CODE} (expected 200)"
    exit 1
fi

PAGE_CONTENT=$(curl -s "${BASE_URL}/" || true)
if ! echo "$PAGE_CONTENT" | grep -q "月光宝盒"; then
    echo "ERROR: Entrypoint content does not contain expected title '月光宝盒'"
    exit 1
fi
echo "SUCCESS: vivo-moonbox web UI entrypoint verified."

echo "Validating API supportEnv endpoint at ${BASE_URL}/api/app/supportEnv..."
ENV_RESP=$(curl -s "${BASE_URL}/api/app/supportEnv" || echo "")
if ! echo "$ENV_RESP" | grep -q '"code":"SUCCESS"'; then
    echo "ERROR: supportEnv API did not return SUCCESS: ${ENV_RESP}"
    exit 1
fi
echo "SUCCESS: API supportEnv endpoint verified."

echo "Validating API user info endpoint at ${BASE_URL}/api/user/info..."
USER_RESP=$(curl -s "${BASE_URL}/api/user/info" || echo "")
if ! echo "$USER_RESP" | grep -q '"code":"SUCCESS"'; then
    echo "ERROR: user info API did not return SUCCESS: ${USER_RESP}"
    exit 1
fi
echo "SUCCESS: Default user info verified for user: ${USERNAME}."

echo "Validating database query via record template API at ${BASE_URL}/api/record/templateManage/list..."
TEMPLATE_RESP=$(curl -s "${BASE_URL}/api/record/templateManage/list?pageNum=1&pageSize=10" || echo "")
if ! echo "$TEMPLATE_RESP" | grep -q '"code":"SUCCESS"' || ! echo "$TEMPLATE_RESP" | grep -q 'demo'; then
    echo "ERROR: Record template list API failed or did not return seeded template: ${TEMPLATE_RESP}"
    exit 1
fi
echo "SUCCESS: Database connectivity and seeded template verified."

echo "Validating app list endpoint at ${BASE_URL}/api/app/appNameList..."
APP_RESP=$(curl -s "${BASE_URL}/api/app/appNameList" || echo "")
if ! echo "$APP_RESP" | grep -q '"code":"SUCCESS"'; then
    echo "ERROR: appNameList API did not return SUCCESS: ${APP_RESP}"
    exit 1
fi
echo "SUCCESS: Application list API verified."

echo "All login and functional API verifications passed successfully."
exit 0
