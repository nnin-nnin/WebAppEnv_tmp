#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
cd "$DIR"

docker compose -f docker/compose.yaml down -v --remove-orphans

echo "Environment reset complete."
