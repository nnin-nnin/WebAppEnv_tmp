#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd -- "$script_dir/.." && pwd)"
compose_file="$project_dir/docker/compose.yaml"

cd "$project_dir"
docker compose -f "$compose_file" config --quiet
docker compose -f "$compose_file" up -d

echo "Waiting for Monica services to be ready..."
for i in $(seq 1 40); do
  if bash "$script_dir/healthcheck.sh" >/dev/null 2>&1; then
    echo "Monica services are healthy (check $i passed)."
    exit 0
  fi
  sleep 3
done

echo "Monica Compose did not become healthy within 120 seconds" >&2
docker compose -f "$compose_file" ps >&2 || true
docker compose -f "$compose_file" logs --tail=80 app web db redis cron queue mail >&2 || true
exit 1
