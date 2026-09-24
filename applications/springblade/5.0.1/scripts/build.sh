#!/bin/bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BUILD_CONTEXT="$PROJECT_DIR/build-context"
IMAGE_DIR="$PROJECT_DIR/image"
rm -rf "$BUILD_CONTEXT"
mkdir -p "$BUILD_CONTEXT"
cd "$BUILD_CONTEXT"

# Fetch backend
git clone https://github.com/chillzhuang/SpringBlade.git springblade-source
cd springblade-source
git checkout e4c98e4f8c07e57f16ece5ea50d00a697515d1eb
cd ..

# Fetch frontend
git clone https://github.com/chillzhuang/Saber.git saber-source
cd saber-source
git checkout 8da0528a1dd3849c052a129d032430bf6ebdaeb3
cd ..

cp -r "$PROJECT_DIR/docker" .
cp -r "$PROJECT_DIR/scripts" .
cp -r "$PROJECT_DIR/resources" .

mkdir -p "$IMAGE_DIR"
docker buildx build \
  --platform linux/amd64 \
  --provenance=false \
  --output "type=docker,dest=$IMAGE_DIR/springblade-5.0.1-linux-amd64.tar" \
  -t springblade:5.0.1 \
  -f docker/Dockerfile .

cd ..
rm -rf build-context

printf '%s  %s\n' "$(shasum -a 256 "$IMAGE_DIR/springblade-5.0.1-linux-amd64.tar" | awk '{print $1}')" "springblade-5.0.1-linux-amd64.tar" > "$IMAGE_DIR/SHA256SUMS"

cat <<EOF > "$IMAGE_DIR/image.json"
{
  "image": "springblade",
  "tag": "5.0.1",
  "platform": "linux/amd64",
  "archive": "springblade-5.0.1-linux-amd64.tar"
}
EOF
