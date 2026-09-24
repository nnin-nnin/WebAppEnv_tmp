#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

IMAGE_NAME="yorem/admidio:5.0.14"

echo "Building Docker image ${IMAGE_NAME} for linux/amd64..."
docker build --platform linux/amd64 -t "${IMAGE_NAME}" -f "${PROJECT_DIR}/docker/Dockerfile" "${PROJECT_DIR}/docker"
echo "Build completed successfully."
