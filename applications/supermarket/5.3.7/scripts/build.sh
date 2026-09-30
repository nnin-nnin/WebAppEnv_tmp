#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
cd "$DIR"

echo "Building supermarket:5.3.7 image..."
docker buildx build \
  --platform linux/amd64 \
  --provenance=false \
  --load \
  -t supermarket:5.3.7 \
  -f "$DIR/docker/Dockerfile" \
  "$DIR"

echo "Creating image directory..."
mkdir -p image

echo "Saving images to local archives..."
docker pull --platform linux/amd64 postgres:13.19
docker pull --platform linux/amd64 redis:6.2.5

docker save --output image/supermarket-5.3.7-linux-amd64.tar supermarket:5.3.7
docker save --output image/postgres-13.19-linux-amd64.tar postgres:13.19
docker save --output image/redis-6.2.5-linux-amd64.tar redis:6.2.5

echo "Generating SHA256SUMS..."
cd image
sha256sum *.tar > SHA256SUMS

echo "Generating image.json..."
cat << 'EOF' > image.json
[
  {
    "service": "application",
    "image": "supermarket",
    "tag": "5.3.7",
    "platform": "linux/amd64",
    "archive": "supermarket-5.3.7-linux-amd64.tar"
  },
  {
    "service": "db",
    "image": "postgres",
    "tag": "13.19",
    "platform": "linux/amd64",
    "archive": "postgres-13.19-linux-amd64.tar"
  },
  {
    "service": "redis",
    "image": "redis",
    "tag": "6.2.5",
    "platform": "linux/amd64",
    "archive": "redis-6.2.5-linux-amd64.tar"
  }
]
EOF

echo "Build complete."
