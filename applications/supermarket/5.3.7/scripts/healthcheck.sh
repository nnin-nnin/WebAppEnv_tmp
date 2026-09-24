#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
cd "$DIR"

echo "Checking if containers are running..."
docker compose -f docker/compose.yaml ps | grep "application" | grep "Up" > /dev/null || (echo "Application container is not running" && exit 1)

echo "Checking HTTP endpoint..."
if ! curl -s -f http://127.0.0.1:18095 > /dev/null; then
  echo "HTTP endpoint check failed."
  exit 1
fi

echo "Healthcheck passed."
