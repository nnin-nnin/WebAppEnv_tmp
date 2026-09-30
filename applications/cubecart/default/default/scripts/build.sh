#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "Building CubeCart image yorem/cubecart:default for platform linux/amd64..."

docker build \
  --platform linux/amd64 \
  -t yorem/cubecart:default \
  -f "${APP_DIR}/docker/Dockerfile" \
  "${APP_DIR}/docker"

echo "Image yorem/cubecart:default built successfully."
