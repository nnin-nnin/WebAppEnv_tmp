#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_FILE="$ROOT_DIR/docker/compose.yaml"
ENV_FILE="$ROOT_DIR/docker/.env"
HEALTHCHECK="$ROOT_DIR/scripts/healthcheck.sh"
compose=(docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE")

"${compose[@]}" config --quiet

required_images=(
  yorem/drupal:8.6.15
  postgres:10.23-bullseye
)

for image in "${required_images[@]}"; do
  if ! docker image inspect "$image" >/dev/null 2>&1; then
    echo "Pulling $image"
    docker pull --platform linux/amd64 "$image"
  fi
done

"${compose[@]}" up -d

deadline=$((SECONDS + 180))
while (( SECONDS < deadline )); do
  if "$HEALTHCHECK" >/dev/null 2>&1; then
    "$HEALTHCHECK"
    exit 0
  fi
  sleep 3
done

echo "Drupal environment did not become healthy within 180 seconds." >&2
"${compose[@]}" ps --all >&2 || true
"${compose[@]}" logs --tail=100 db installer application >&2 || true
exit 1
