#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
IMAGE_DIR="$PROJECT_DIR/image"
cd "$IMAGE_DIR"
sha256sum -c SHA256SUMS
docker load -i collabtive-master-linux-amd64.tar
docker load -i mysql-5.7-linux-amd64.tar
echo "Images loaded successfully."
