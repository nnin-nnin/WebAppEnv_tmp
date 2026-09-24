#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "Building AltoCMS image yorem/altocms:1.1.31 for platform linux/amd64..."

DOCKER_BUILDKIT=0 docker build \
  --platform linux/amd64 \
  -t yorem/altocms:1.1.31 \
  -f "${APP_DIR}/docker/Dockerfile" \
  "${APP_DIR}/docker"

echo "Image yorem/altocms:1.1.31 built successfully."
