#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$DIR/.."

cd "$PROJECT_DIR"

PROJECT_NAME="apache-inlong-2-4-0"
COMPOSE=(docker compose -p "$PROJECT_NAME" -f docker/compose.yaml)

echo "Checking compose configuration..."
"${COMPOSE[@]}" config --quiet

echo "Checking container status..."
UNHEALTHY=$("${COMPOSE[@]}" ps --status=exited --status=dead -q | wc -l)
if [ "$UNHEALTHY" -gt 0 ]; then
  echo "Some containers are not running"
  exit 1
fi

echo "Checking HTTP endpoint..."
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:80)
if [ "$HTTP_STATUS" -eq 200 ] || [ "$HTTP_STATUS" -eq 301 ] || [ "$HTTP_STATUS" -eq 302 ]; then
  echo "Application is accessible"
  exit 0
else
  echo "Application returned HTTP $HTTP_STATUS"
  exit 1
fi
