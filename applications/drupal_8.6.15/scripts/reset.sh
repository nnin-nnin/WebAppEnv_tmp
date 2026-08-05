#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_FILE="$ROOT_DIR/docker/compose.yaml"
ENV_FILE="$ROOT_DIR/docker/.env"
compose=(docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE")

"${compose[@]}" config --quiet
"${compose[@]}" down --volumes --remove-orphans
echo "Removed only the drupal-8615 Compose containers, network, and named volumes."
