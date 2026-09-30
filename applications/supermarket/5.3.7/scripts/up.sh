#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
cd "$DIR"

echo "Checking compose configuration..."
docker compose -f docker/compose.yaml config --quiet

echo "Starting Supermarket environment..."
docker compose -f docker/compose.yaml up -d

echo "Waiting for Supermarket to accept HTTP connections on port 18095..."
for i in {1..60}; do
  if curl -s -f http://127.0.0.1:18095 > /dev/null; then
    echo "Application is up and running!"
    exit 0
  fi
  sleep 3
done

echo "Timeout waiting for application."
docker compose -f docker/compose.yaml ps
docker compose -f docker/compose.yaml logs --tail=50
exit 1
