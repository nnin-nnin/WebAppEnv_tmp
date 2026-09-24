#!/bin/bash
set -Eeuo pipefail
container="${1:-${FLUXBB_CONTAINER:-fluxbb-1.5.11}}"
if ! docker inspect "$container" >/dev/null 2>&1; then
    candidates=($(docker ps -a --filter "name=fluxbb" --format '{{.ID}}'))
    if [[ "${#candidates[@]}" -gt 0 ]]; then
        container="${candidates[0]}"
    fi
fi
if docker inspect "$container" >/dev/null 2>&1; then
    docker rm --force --volumes "$container" >/dev/null
    echo "FluxBB container $container has been reset."
else
    echo "FluxBB container not found."
fi
