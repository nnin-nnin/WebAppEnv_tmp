#!/bin/bash
set -e
cd "$(dirname "$0")/.."

echo "Building application image..."
rm -rf tmp-build
git clone https://github.com/yangzongzhuan/RuoYi.git tmp-build
git -C tmp-build checkout 15e3a929ced99ff7cd55ddc727573f84498e2f5c
if [ -d "source/patches" ]; then
    for p in source/patches/*.patch; do
        if [ -f "$p" ]; then
            patch -d tmp-build -p1 < "$p"
        fi
    done
fi
docker buildx build --platform linux/amd64 --provenance=false --output type=docker,dest=image/ruoyi-4.8.3-linux-amd64.tar -t ruoyi:4.8.3 -f docker/Dockerfile tmp-build
rm -rf tmp-build

echo "Exporting database image..."
echo "FROM mysql:8.0.36" | docker buildx build --platform linux/amd64 --provenance=false --output type=docker,dest=image/mysql-8.0.36-linux-amd64.tar -t mysql:8.0.36 -

echo "Generating image.json..."
cat << 'EOF' > image/image.json
[
  {
    "service": "application",
    "image": "ruoyi",
    "tag": "4.8.3",
    "platform": "linux/amd64",
    "archive": "ruoyi-4.8.3-linux-amd64.tar"
  },
  {
    "service": "db",
    "image": "mysql",
    "tag": "8.0.36",
    "platform": "linux/amd64",
    "archive": "mysql-8.0.36-linux-amd64.tar"
  }
]
EOF

echo "Generating SHA256SUMS..."
cd image
sha256sum *.tar > SHA256SUMS
cd ..
echo "Build completed."
