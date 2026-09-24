#!/usr/bin/env bash
set -eo pipefail

# Strip local proxies to ensure direct localhost connections
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

echo "Starting Elasticsearch 8.17.10 with Docker Compose..."
cd "$APP_DIR"

# Platform compatibility override for ARM64 macOS if needed
HOST_ARCH=$(uname -m)
COMPOSE_ARGS=("-f" "docker/compose.yaml")
if [ -f "docker/compose.override.yaml" ]; then
    COMPOSE_ARGS+=("-f" "docker/compose.override.yaml")
elif [ "$HOST_ARCH" = "arm64" ] || [ "$HOST_ARCH" = "aarch64" ]; then
    cat << 'EOF' > "docker/compose.override.yaml"
services:
  elasticsearch:
    platform: linux/arm64
EOF
    COMPOSE_ARGS+=("-f" "docker/compose.override.yaml")
fi

docker compose "${COMPOSE_ARGS[@]}" up -d

echo "Elasticsearch containers started. Waiting for service readiness..."
HOST_PORT="${HOST_PORT:-18584}"
URL="http://${HOST:-localhost}:${HOST_PORT}"

for i in $(seq 1 30); do
    if curl --noproxy "*" --max-time 3 -s -o /dev/null -w "%{http_code}" "$URL/" | grep -qE "^[23]"; then
        echo "SUCCESS: Elasticsearch is ready at $URL/!"
        exit 0
    fi
    sleep 1
done

echo "Containers running. Check $URL/"
