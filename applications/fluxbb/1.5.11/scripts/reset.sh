#!/bin/bash
set -Eeuo pipefail
container="${1:-${FLUXBB_CONTAINER:-}}"
if [ -z "$container" ]; then echo "Usage: $0 CONTAINER_NAME_OR_ID" >&2; exit 2; fi
echo "Resetting FluxBB database and configuration in container $container"
docker exec "$container" /opt/fluxbb-scripts/reset-in-container.sh
docker restart "$container" >/dev/null
echo 'FluxBB was reset and is being initialized with the benchmark administrator again.'
