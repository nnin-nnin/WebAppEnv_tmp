#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
docker compose -f "${DIR}/docker/compose.yaml" up -d

echo "Waiting for Thelia service to be healthy..."
for i in {1..60}; do
    if curl -s -I "http://127.0.0.1:18869/" | grep -q "HTTP/"; then
        echo "Thelia is up and responding."
        exit 0
    fi
    sleep 2
done

echo "Thelia did not respond within expected time."
exit 1
