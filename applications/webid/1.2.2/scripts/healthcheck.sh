#!/bin/bash
export COMPOSE_PROJECT_NAME=webid-1-2-2
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$( dirname "$DIR" )"
COMPOSE_FILE="$PROJECT_DIR/docker/compose.yaml"

cd "$PROJECT_DIR"

# Check compose config
docker compose -f "$COMPOSE_FILE" config --quiet

# Check running services
UNHEALTHY=$(docker compose -f "$COMPOSE_FILE" ps --format json | jq -r 'select(.Health != "healthy") | .Name')
if [ -n "$UNHEALTHY" ]; then
    echo "The following services are not healthy:"
    echo "$UNHEALTHY"
    exit 1
fi

# Check HTTP access
APP_URL="http://127.0.0.1:18086/"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")

if [ "$HTTP_CODE" != "200" ]; then
    echo "Application HTTP check failed with code $HTTP_CODE"
    exit 1
fi

echo "Environment is healthy."
exit 0
