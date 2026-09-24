#!/bin/bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
IMAGE_DIR="$PROJECT_DIR/image"
mkdir -p "$IMAGE_DIR"

docker buildx build \
  --platform linux/amd64 \
  --provenance=false \
  --output "type=docker,dest=$IMAGE_DIR/phpbb-3.3.17-linux-amd64.tar" \
  -t phpbb:3.3.17 \
  -f "$PROJECT_DIR/docker/Dockerfile" \
  "$PROJECT_DIR"

printf 'FROM mysql:8.0.35\n' | docker buildx build \
  --platform linux/amd64 \
  --provenance=false \
  --output "type=docker,dest=$IMAGE_DIR/mysql-8.0.35-linux-amd64.tar" \
  -t mysql:8.0.35 \
  -f - .

cd "$IMAGE_DIR"
cat <<EOF > image.json
[
  {
    "service": "application",
    "image": "phpbb",
    "tag": "3.3.17",
    "platform": "linux/amd64",
    "archive": "phpbb-3.3.17-linux-amd64.tar"
  },
  {
    "service": "db",
    "image": "mysql",
    "tag": "8.0.35",
    "platform": "linux/amd64",
    "archive": "mysql-8.0.35-linux-amd64.tar"
  }
]
EOF
sha256sum *.tar > SHA256SUMS
