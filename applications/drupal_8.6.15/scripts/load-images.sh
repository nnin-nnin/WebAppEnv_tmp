#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IMAGE_DIR="$ROOT_DIR/image"

cd "$IMAGE_DIR"

if [[ ! -s SHA256SUMS ]]; then
  docker pull --platform linux/amd64 yorem/sop-drupal:8.6.15
  docker pull --platform linux/amd64 postgres:10.23-bullseye
  echo "Docker Hub service images are ready"
  exit 0
fi

sha256sum -c SHA256SUMS

for archive in \
  drupal-app-8.6.15-linux-amd64.tar \
  postgres-10.23-linux-amd64.tar; do
  test -s "$archive"
  echo "Loading $archive"
  docker load --input "$archive"
done

docker tag sop/drupal:8.6.15 yorem/sop-drupal:8.6.15

echo "All local Drupal 8.6.15 service images loaded"
