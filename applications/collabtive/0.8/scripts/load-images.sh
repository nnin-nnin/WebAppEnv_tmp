#!/bin/bash
set -e

cd "$(dirname "$0")/.."

if [ ! -d "image" ]; then
    echo "No image directory found."
    exit 1
fi

if [ -f "image/SHA256SUMS" ]; then
    echo "Verifying checksums..."
    (cd image && sha256sum -c SHA256SUMS)
fi

echo "Loading local images..."
for tar_file in image/*.tar; do
    if [ -f "$tar_file" ]; then
        echo "Loading $tar_file..."
        docker load -i "$tar_file"
    fi
done

echo "Images loaded."
