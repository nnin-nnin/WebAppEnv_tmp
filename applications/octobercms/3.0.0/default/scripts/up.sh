#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting October CMS with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for October CMS to become ready..."
HOST_PORT="${HOST_PORT:-18605}"
for i in $(seq 1 45); do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
        echo "October CMS is responding with HTTP $HTTP_CODE!"
        break
    fi
    sleep 2
done

# Ensure default admin account exists
docker compose -f docker/compose.yaml exec -T web php -r '
require "/var/www/html/bootstrap/autoload.php";
$app = require_once "/var/www/html/bootstrap/app.php";
$app->make(\Illuminate\Contracts\Console\Kernel::class)->bootstrap();
if (\Backend\Models\User::count() == 0) {
    \Backend\Models\User::createDefaultAdmin([
        "first_name" => "Admin",
        "last_name" => "User",
        "email" => "admin@example.com",
        "login" => "admin",
        "password" => "admin",
        "password_confirmation" => "admin"
    ]);
}
' 2>/dev/null || true
