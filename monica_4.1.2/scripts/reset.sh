#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd -- "$script_dir/.." && pwd)"
compose_file="$project_dir/docker/compose.yaml"

cd "$project_dir"
docker compose -f "$compose_file" down --volumes --remove-orphans
echo "Monica 4.1.2 Compose containers, network, and named volumes removed"
