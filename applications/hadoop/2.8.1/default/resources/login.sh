#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18644}"
HOST="${HOST:-127.0.0.1}"
TARGET_URL="http://${HOST}:${HOST_PORT}/cluster"

echo "Verifying Apache Hadoop YARN ResourceManager at ${TARGET_URL}..."

MAX_ATTEMPTS=5
for i in $(seq 1 $MAX_ATTEMPTS); do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${TARGET_URL}" || true)
    if [ "$HTTP_CODE" = "200" ]; then
        echo "SUCCESS: Hadoop YARN ResourceManager /cluster is reachable (HTTP ${HTTP_CODE})."
        exit 0
    fi
    echo "Attempt $i: received HTTP ${HTTP_CODE}, waiting 2s..."
    sleep 2
done

echo "FAILED: Expected HTTP 200 but received ${HTTP_CODE} from ${TARGET_URL}"
exit 1
