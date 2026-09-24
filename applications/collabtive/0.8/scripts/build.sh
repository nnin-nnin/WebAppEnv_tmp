#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")/.."

if [ ! -d "source_repo" ]; then
    echo "Cloning Collabtive..."
    git clone https://github.com/3logy/Collabtive.git source_repo
    cd source_repo
    git checkout d185b32fcecbd3745102a39262651fd2827bce6f
    rm -rf .git
    cd ..
fi

echo "Building Collabtive Docker images..."
mkdir -p image
docker buildx build \
    --platform linux/amd64 \
    --provenance=false \
    --output type=docker,dest=image/collabtive-0.8-linux-amd64.tar \
    -t collabtive:0.8 -f docker/Dockerfile .
printf 'FROM mysql:5.7\n' | docker buildx build \
    --platform linux/amd64 \
    --provenance=false \
    --output type=docker,dest=image/mysql-5.7-linux-amd64.tar \
    -t mysql:5.7 -f - .
cd image
cat > image.json <<'EOF'
[
  {"service":"application","image":"collabtive","tag":"0.8","platform":"linux/amd64","archive":"collabtive-0.8-linux-amd64.tar"},
  {"service":"db","image":"mysql","tag":"5.7","platform":"linux/amd64","archive":"mysql-5.7-linux-amd64.tar"}
]
EOF
sha256sum *.tar > SHA256SUMS
