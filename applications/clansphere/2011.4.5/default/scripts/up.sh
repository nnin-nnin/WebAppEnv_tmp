#!/bin/bash
set -e

# Strip local proxies to ensure healthcheck probes direct localhost
export http_proxy=""
export https_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export all_proxy=""
export ALL_PROXY=""
export no_proxy="*"
export NO_PROXY="*"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting Clansphere 2011.4.5 with Docker Compose..."
cd "$APP_DIR"

# Platform compatibility override for ARM64 macOS if needed
HOST_ARCH=$(uname -m)
COMPOSE_ARGS=("-f" "docker/compose.yaml")
if [ -f "docker/compose.override.yaml" ]; then
    COMPOSE_ARGS+=("-f" "docker/compose.override.yaml")
elif [ "$HOST_ARCH" = "arm64" ] || [ "$HOST_ARCH" = "aarch64" ]; then
    cat << 'EOF' > "docker/compose.override.yaml"
services:
  web:
    platform: linux/arm64
EOF
    COMPOSE_ARGS+=("-f" "docker/compose.override.yaml")
fi

docker compose "${COMPOSE_ARGS[@]}" up -d

echo "Containers started. Waiting for application to initialize..."
HOST_PORT="${HOST_PORT:-18531}"
URL="http://${HOST:-localhost}:${HOST_PORT}"

# Wait for service readiness (up to 30s)
for i in $(seq 1 30); do
    if curl --noproxy "*" --max-time 3 -s -o /dev/null -w "%{http_code}" "$URL" | grep -qE "^[23]"; then
        echo "SUCCESS: Clansphere is ready at $URL!"
        exit 0
    fi
    sleep 1
done

echo "Containers running. Check $URL"
