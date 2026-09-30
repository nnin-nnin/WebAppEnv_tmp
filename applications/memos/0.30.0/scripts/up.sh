#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

PROJECT_NAME="memos-0-30-0"
COMPOSE=(docker compose -p "$PROJECT_NAME" -f docker/compose.yaml)

echo "Validating Compose file..."
"${COMPOSE[@]}" config --quiet

echo "Pulling images..."
"${COMPOSE[@]}" pull

echo "Starting services..."
"${COMPOSE[@]}" up -d

echo "Waiting for services to be ready..."
max_retries=30
count=0
while [ $count -lt $max_retries ]; do
  if bash scripts/healthcheck.sh >/dev/null 2>&1; then
    echo "Services are up and healthy."
    # Initialize host admin user if not exists
    bash resources/register.sh admin 123456 >/dev/null 2>&1 || true
    "${COMPOSE[@]}" ps
    exit 0
  fi
  count=$((count + 1))
  echo "Waiting for services... ($count/$max_retries)"
  sleep 3
done

echo "Services failed to start properly."
"${COMPOSE[@]}" ps
"${COMPOSE[@]}" logs --tail 50
exit 1
