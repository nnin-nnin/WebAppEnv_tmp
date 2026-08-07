#!/usr/bin/env bash
set -euo pipefail

: "${MAUTIC_ADMIN_PASSWORD:?Set MAUTIC_ADMIN_PASSWORD through the controlled credential channel for image initialization}"
image_name=asteriskax001/sop-mautic:5.0.4
archive=image/mautic-5.0.4-linux-amd64.tar
mkdir -p image

docker build --platform linux/amd64 \
  --secret id=admin_password,env=MAUTIC_ADMIN_PASSWORD \
  -f docker/Dockerfile -t "$image_name" .
docker image inspect "$image_name" > image/image.json
docker save --output "$archive" "$image_name"
(cd image && sha256sum "$(basename "$archive")" > SHA256SUMS)

echo "Built $image_name"
echo "Archive: $archive"
