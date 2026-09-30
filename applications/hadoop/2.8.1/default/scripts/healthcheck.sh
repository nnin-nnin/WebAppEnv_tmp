#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18644}"
HOST="${HOST:-127.0.0.1}"
TARGET_URL="http://${HOST}:${HOST_PORT}/cluster"

echo "Checking Apache Hadoop YARN ResourceManager health on ${HOST}:${HOST_PORT}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${TARGET_URL}" || true)

if [ "$HTTP_CODE" = "200" ]; then
    echo "SUCCESS: Hadoop YARN ResourceManager returned HTTP ${HTTP_CODE} on ${TARGET_URL}"
    exit 0
else
    echo "FAILED: Hadoop YARN ResourceManager returned HTTP ${HTTP_CODE} on ${TARGET_URL}"
    exit 1
fi
