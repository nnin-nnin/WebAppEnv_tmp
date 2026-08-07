#!/usr/bin/env bash
set -Eeuo pipefail

container_name=minthcm-4-0-4
image=asteriskax001/sop-minthcm:4.0.4
host_port=18520

if docker inspect "$container_name" >/dev/null 2>&1; then
    state=$(docker inspect -f '{{.State.Status}}' "$container_name")
    if [ "$state" != running ]; then
        docker start "$container_name"
    fi
else
    docker run --name "$container_name" -d -p "$host_port":80 "$image"
fi
