#!/bin/bash
set -e
cd "$(dirname "$0")/../image"
if [ ! -f "SHA256SUMS" ]; then
    echo "SHA256SUMS not found."
    exit 1
fi
sha256sum -c SHA256SUMS
docker load -i phpbb-3.3.17-linux-amd64.tar
docker load -i mysql-8.0.35-linux-amd64.tar
echo "Images loaded successfully."
