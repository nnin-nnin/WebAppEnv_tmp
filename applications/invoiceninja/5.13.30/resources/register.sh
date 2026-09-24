#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

EMAIL="${1:-testuser@example.com}"
PASSWORD="${2:-testpassword}"

echo "Creating new user $EMAIL..."
docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml exec app php artisan ninja:create-account --email="$EMAIL" --password="$PASSWORD"
