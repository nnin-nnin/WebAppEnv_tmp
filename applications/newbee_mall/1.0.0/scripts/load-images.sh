#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
echo "Loading images from local archives..."

if [ ! -f "image/SHA256SUMS" ]; then
  echo "Error: image/SHA256SUMS not found."
  exit 1
fi

cd image
sha256sum -c SHA256SUMS

docker load -i application-1.0.0-linux-amd64.tar
docker load -i db-8.0.35-linux-amd64.tar

echo "Images loaded successfully."
