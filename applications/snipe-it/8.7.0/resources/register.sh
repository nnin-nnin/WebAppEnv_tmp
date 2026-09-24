#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(dirname "$DIR")"
COMPOSE_FILE="$APP_DIR/docker/compose.yaml"

USERNAME="${1:-testuser}"
EMAIL="${2:-testuser@example.com}"
PASSWORD="${3:-testuser1234}"
FIRST_NAME="${4:-Test}"
LAST_NAME="${5:-User}"

echo "Creating user $USERNAME via CLI (no public registration available)..."

export COMPOSE_PROJECT_NAME=snipeit-8-7-0
cd "$APP_DIR"
docker compose -f "$COMPOSE_FILE" exec -T app php artisan tinker --execute="
    if (!App\\Models\\User::where('username', '$USERNAME')->exists()) {
        \$user = new App\\Models\\User;
        \$user->first_name = '$FIRST_NAME';
        \$user->last_name = '$LAST_NAME';
        \$user->username = '$USERNAME';
        \$user->email = '$EMAIL';
        \$user->password = bcrypt('$PASSWORD');
        \$user->activated = 1;
        \$user->permissions = '{\"user\":1}';
        if (!\$user->save()) {
            throw new RuntimeException('Failed to create user.');
        }
        echo \"User $USERNAME created successfully.\\n\";
    } else {
        echo \"User $USERNAME already exists.\\n\";
    }
"

env USERNAME="$USERNAME" PASSWORD="$PASSWORD" bash "$DIR/login.sh"
