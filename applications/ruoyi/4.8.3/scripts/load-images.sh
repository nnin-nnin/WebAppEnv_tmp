#!/bin/bash
set -e
cd "$(dirname "$0")/.."

echo "Loading images from image directory..."
if [ ! -f "image/image.json" ] || [ ! -f "image/SHA256SUMS" ]; then
    echo "Error: image.json or SHA256SUMS not found!"
    exit 1
fi

cd image
echo "Checking checksums..."
sha256sum -c SHA256SUMS
cd ..

for archive in image/*.tar; do
    echo "Loading $archive..."
    docker load -i "$archive"
done
echo "All images loaded successfully."
