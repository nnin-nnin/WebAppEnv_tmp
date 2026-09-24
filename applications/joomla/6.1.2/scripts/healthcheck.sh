#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

PROJECT_NAME="joomla-6-1-2"
COMPOSE=(docker compose -p "$PROJECT_NAME" -f docker/compose.yaml)

echo "Checking if services are running..."
if ! "${COMPOSE[@]}" ps --status running | grep joomla >/dev/null; then
    echo "Joomla is not running!"
    exit 1
fi

echo "Checking HTTP endpoint..."
if ! curl -s -f http://127.0.0.1:18535 > /dev/null; then
    echo "HTTP endpoint check failed."
    exit 1
fi

echo "Healthcheck passed."
exit 0
