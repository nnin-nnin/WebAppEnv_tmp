#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
docker compose -f "${DIR}/docker/compose.yaml" down -v --remove-orphans
echo "Thelia environment reset successfully."
