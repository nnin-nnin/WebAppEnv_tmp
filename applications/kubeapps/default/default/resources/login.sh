#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18837}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Kubeapps root endpoint at ${BASE_URL}/..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Kubeapps root endpoint returned HTTP 200."
else
    echo "FAILED: Kubeapps root endpoint returned HTTP ${HTTP_CODE} (expected 200)."
    exit 1
fi

echo "Verifying dashboard HTML payload..."
HTML_CONTENT=$(curl -s "${BASE_URL}/" || true)
if echo "$HTML_CONTENT" | grep -q "id=\"root\""; then
    echo "SUCCESS: Root element container found in web payload."
else
    echo "FAILED: Dashboard web payload did not contain root container."
    exit 1
fi

echo "Checking Kubeapps config endpoint at ${BASE_URL}/config.json..."
CONFIG_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/config.json" || true)
if [ "$CONFIG_CODE" -eq 200 ]; then
    echo "SUCCESS: Kubeapps config.json returned HTTP 200."
else
    echo "FAILED: Kubeapps config.json returned HTTP ${CONFIG_CODE} (expected 200)."
    exit 1
fi

echo "Checking Kubeapps health endpoint at ${BASE_URL}/healthz..."
HEALTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/healthz" || true)
if [ "$HEALTH_CODE" -eq 200 ]; then
    echo "SUCCESS: Kubeapps healthz endpoint returned HTTP 200."
else
    echo "FAILED: Kubeapps healthz endpoint returned HTTP ${HEALTH_CODE} (expected 200)."
    exit 1
fi

echo "Login check PASSED!"
exit 0
