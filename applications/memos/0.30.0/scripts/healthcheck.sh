#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

PROJECT_NAME="memos-0-30-0"
COMPOSE=(docker compose -p "$PROJECT_NAME" -f docker/compose.yaml)

# Check if compose config is valid
"${COMPOSE[@]}" config --quiet

# Check if container is running
if ! "${COMPOSE[@]}" ps | grep -i "Up" > /dev/null; then
  echo "Container is not running."
  exit 1
fi

# Check HTTP endpoint
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:5230 || echo "000")
if [ "$HTTP_STATUS" -ne 200 ]; then
  echo "HTTP endpoint returned $HTTP_STATUS"
  exit 1
fi

echo "Healthcheck passed."
exit 0
