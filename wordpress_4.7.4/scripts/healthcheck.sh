#!/usr/bin/env bash
set -euo pipefail

base_url="${WORDPRESS_BASE_URL:-http://localhost:18084}"
curl --fail --silent --show-error --location "$base_url/wp-login.php" >/dev/null
echo "WordPress health check succeeded: $base_url"
