#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
echo "Checking out source and building newbee-mall image..."

if [ ! -d "source/newbee-mall-source" ]; then
  git clone https://github.com/newbee-ltd/newbee-mall.git source/newbee-mall-source
fi

cd source/newbee-mall-source
git checkout a069069b07027613bf0e7f571736be86f431faee
cd ../..

mkdir -p image
echo "Exporting images to local archives..."
docker buildx build \
  --platform linux/amd64 \
  --provenance=false \
  --output type=docker,dest=image/application-1.0.0-linux-amd64.tar \
  -t newbee-mall:1.0.0 \
  -f docker/Dockerfile source/newbee-mall-source
printf 'FROM mysql:8.0.35\n' | docker buildx build \
  --platform linux/amd64 \
  --provenance=false \
  --output type=docker,dest=image/db-8.0.35-linux-amd64.tar \
  -t mysql:8.0.35 \
  -f - .

cd image
sha256sum *.tar > SHA256SUMS

cat <<EOF > image.json
[
  {
    "service": "application",
    "image": "newbee-mall",
    "tag": "1.0.0",
    "platform": "linux/amd64",
    "archive": "application-1.0.0-linux-amd64.tar"
  },
  {
    "service": "db",
    "image": "mysql",
    "tag": "8.0.35",
    "platform": "linux/amd64",
    "archive": "db-8.0.35-linux-amd64.tar"
  }
]
EOF

echo "Build and export complete."
