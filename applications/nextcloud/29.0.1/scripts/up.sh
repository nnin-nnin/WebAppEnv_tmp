#!/usr/bin/env bash
set -Eeuo pipefail

container_name=nextcloud-29-0-1
image=asteriskax001/sop-nextcloud:29.0.1
host_port=18522

if docker inspect "$container_name" >/dev/null 2>&1; then
    state=$(docker inspect -f '{{.State.Status}}' "$container_name")
    if [ "$state" != running ]; then
        docker start "$container_name"
    fi
else
    docker run --name "$container_name" -d -p "$host_port":80 "$image"
fi
