#!/bin/bash
set -Eeuo pipefail
cd "$(dirname "$0")/.."
image='asteriskax001/sop-fluxbb:1.5.11'
tar_path='image/fluxbb-1.5.11-linux-amd64.tar'
docker build --platform linux/amd64 --file docker/Dockerfile --tag "$image" .
rm -f "$tar_path"
docker save --output "$tar_path" "$image"
docker image inspect "$image" > image/image.json
(cd image && sha256sum "$(basename "$tar_path")" image.json > SHA256SUMS)
echo "Built $image"
echo "Archive: $tar_path"
