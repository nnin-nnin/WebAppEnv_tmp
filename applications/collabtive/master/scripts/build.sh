#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
IMAGE_DIR="$PROJECT_DIR/image"
mkdir -p "$IMAGE_DIR"

docker buildx build \
  --platform linux/amd64 \
  --provenance=false \
  --output "type=docker,dest=$IMAGE_DIR/collabtive-master-linux-amd64.tar" \
  -t collabtive:master \
  -f "$PROJECT_DIR/docker/Dockerfile" \
  "$PROJECT_DIR"

printf 'FROM mysql:5.7\n' | docker buildx build \
  --platform linux/amd64 \
  --provenance=false \
  --output "type=docker,dest=$IMAGE_DIR/mysql-5.7-linux-amd64.tar" \
  -t mysql:5.7 \
  -f - .

cd "$IMAGE_DIR"
cat > image.json <<'EOF'
[
  {"service":"application","image":"collabtive","tag":"master","platform":"linux/amd64","archive":"collabtive-master-linux-amd64.tar"},
  {"service":"db","image":"mysql","tag":"5.7","platform":"linux/amd64","archive":"mysql-5.7-linux-amd64.tar"}
]
EOF
sha256sum *.tar > SHA256SUMS
