#!/usr/bin/env bash
set -euo pipefail

username="${1:-}"
password="${2:-}"
email="${3:-}"
container_name="${WORDPRESS_CONTAINER_NAME:-wordpress-4.7.4}"

if [[ -z "$username" || -z "$password" || -z "$email" ]]; then
  echo "Usage: $0 <username> <password> <email>" >&2
  exit 2
fi

if ! docker container inspect "$container_name" >/dev/null 2>&1; then
  echo "WordPress container '$container_name' is not running or does not exist" >&2
  exit 1
fi

docker exec -u www-data "$container_name" \
  php /usr/local/bin/wordpress-user-create.php "$username" "$password" "$email"

echo "WordPress subscriber created: $username"
