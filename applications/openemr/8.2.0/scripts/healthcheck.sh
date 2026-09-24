#!/bin/bash
set -e
cd "$(dirname "$0")/.."

export COMPOSE_PROJECT_NAME=openemr-8-2-0

docker compose -f docker/compose.yaml config --quiet

if ! docker compose -f docker/compose.yaml ps | grep -q "openemr"; then
    echo "openemr container not found."
    exit 1
fi

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:8085/interface/login/login.php?site=default)
if [ "$HTTP_CODE" -ne 200 ] && [ "$HTTP_CODE" -ne 302 ]; then
    echo "HTTP endpoint check failed. HTTP_CODE=$HTTP_CODE"
    exit 1
fi

echo "Healthcheck passed."
exit 0
