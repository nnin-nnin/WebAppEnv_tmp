#!/bin/bash
set -Eeuo pipefail
cd "$(dirname "$0")/.."
IMAGE=asteriskax001/sop-espocrm:8.2.5
mkdir -p image
docker build --platform linux/amd64 -f docker/Dockerfile -t "$IMAGE" .
docker save --output image/espocrm-8.2.5-linux-amd64.tar "$IMAGE"
docker image inspect "$IMAGE" > image/image.json
(cd image && sha256sum espocrm-8.2.5-linux-amd64.tar image.json > SHA256SUMS)
