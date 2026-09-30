#!/bin/bash
set -e
cd "$(dirname "$0")/.."

export COMPOSE_PROJECT_NAME=openemr-8-2-0

docker compose -f docker/compose.yaml down -v
echo "Reset complete."
