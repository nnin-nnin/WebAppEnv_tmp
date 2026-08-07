#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -lt 2 || "$#" -gt 4 ]]; then
  echo "Usage: $0 EMAIL PASSWORD [FIRST_NAME] [LAST_NAME]" >&2
  exit 2
fi

email="$1"
password="$2"
first_name="${3:-Benchmark}"
last_name="${4:-User}"
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd -- "$script_dir/.." && pwd)"
compose_file="$project_dir/docker/compose.yaml"

case "$email$password$first_name$last_name" in
  *'"'*|*'\\'*|*$'\n'*)
    echo "Registration parameters cannot contain JSON quotes, backslashes, or newlines" >&2
    exit 2
    ;;
esac

cd "$project_dir"
printf 'yes\n' | docker compose -f "$compose_file" exec -T app \
  php artisan account:create \
    --email="$email" \
    --password="$password" \
    --firstname="$first_name" \
    --lastname="$last_name"

echo "Monica account created through artisan account:create: $email"
