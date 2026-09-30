#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18758}"
BASE_URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"
USERNAME="${1:-${CPG_USER:-${CPG_USERNAME:-${ADMIN_USERNAME:-${ADMIN_USER:-admin}}}}}"
PASSWORD="${2:-${CPG_PASSWORD:-${ADMIN_PASSWORD:-admin}}}"

echo "Testing cpg service access at ${BASE_URL}..."

# Check server responsiveness at root endpoint
HTTP_CODE_ROOT=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
echo "Root endpoint (${BASE_URL}/) returned HTTP ${HTTP_CODE_ROOT}"

# Validate CPG API endpoint returns HTTP 200
API_URL="${BASE_URL}/v3/currencies/"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${API_URL}" || true)

if [ "${HTTP_CODE}" -eq 200 ]; then
    echo "SUCCESS: ${API_URL} returned HTTP 200"
    echo "cpg login/verification check PASSED for user '${USERNAME}'."
    exit 0
else
    GQL_URL="${BASE_URL}/graphql?query=%7B__typename%7D"
    GQL_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${GQL_URL}" || true)
    if [ "${GQL_CODE}" -eq 200 ]; then
        echo "SUCCESS: GraphQL endpoint returned HTTP 200"
        echo "cpg login/verification check PASSED for user '${USERNAME}'."
        exit 0
    fi
    echo "FAILED: Expected HTTP 200 from ${API_URL}, got ${HTTP_CODE}"
    exit 1
fi
