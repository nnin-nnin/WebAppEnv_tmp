#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

NEW_USER=${1:-"testuser"}
NEW_PASS=${2:-"testpassword123"}
NEW_EMAIL=${3:-"testuser@example.com"}

echo "Creating user $NEW_USER via Joomla CLI..."
docker compose -f docker/compose.yaml exec -T joomla php cli/joomla.php user:add --username="$NEW_USER" --name="$NEW_USER" --password="$NEW_PASS" --email="$NEW_EMAIL" --usergroup="Registered"

echo "User creation completed."
