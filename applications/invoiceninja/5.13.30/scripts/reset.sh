#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

echo "Stopping and removing containers, networks..."
docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml down -v

echo "Reset complete."
