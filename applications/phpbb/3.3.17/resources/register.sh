#!/bin/bash
set -e

NEW_USERNAME="${1:-testuser}"
NEW_PASSWORD="${2:-testpassword123}"
NEW_EMAIL="${3:-testuser@example.com}"

cd "$(dirname "$0")/../docker"

echo "Registering user via phpbbcli..."
docker compose exec application php /var/www/html/bin/phpbbcli.php user:add "$NEW_USERNAME" --password "$NEW_PASSWORD" --email "$NEW_EMAIL"

echo "Registration successful."
