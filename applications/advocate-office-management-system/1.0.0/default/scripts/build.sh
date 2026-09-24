#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

IMAGE_NAME="yorem/advocate-office:1.0.0"

echo "Building Docker image ${IMAGE_NAME} for platform linux/amd64..."
docker build --platform linux/amd64 -t "${IMAGE_NAME}" -f "${APP_DIR}/docker/Dockerfile" "${APP_DIR}/docker"

echo "Image ${IMAGE_NAME} built successfully."
