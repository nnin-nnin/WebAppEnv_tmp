#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

echo "Stopping and removing containers along with volumes..."
docker compose -p memos-0-30-0 -f docker/compose.yaml down -v

echo "Reset completed."
