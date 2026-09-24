#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18588}"
ADMIN_USER="${ADMIN_USER:-${ADMIN_USERNAME:-${APP_USER:-admin}}}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-AdminPassword123!}}"

echo "Starting LibreNMS 24.8.0 with Docker Compose..."
cd "$APP_DIR"

if ! docker compose -f docker/compose.yaml up -d 2>/dev/null; then
    echo "Applying architecture compatibility fallback for host..."
    docker compose -f docker/compose.yaml -f <(echo 'services: {app: {platform: linux/arm64}}') up -d
fi

echo "Waiting for LibreNMS web container to initialize database and start services..."
for i in {1..90}; do
    if curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/" | grep -qE "^(200|302)$"; then
        echo "LibreNMS web port is responding!"
        break
    fi
    sleep 2
done

# Check and complete post-install setup if needed
echo "Finalizing LibreNMS installation and user credentials..."
for i in {1..30}; do
    if docker compose -f docker/compose.yaml exec -T app test -f /opt/librenms/.env >/dev/null 2>&1; then
        break
    fi
    sleep 1
done

# Remove INSTALL wizard flag to enable direct login
docker compose -f docker/compose.yaml exec -T -u root app sed -i '/INSTALL=/d' /opt/librenms/.env || true

# Seed admin user
docker compose -f docker/compose.yaml exec -T -u librenms app php -r "
require '/opt/librenms/vendor/autoload.php';
\$app = require_once '/opt/librenms/bootstrap/app.php';
\$kernel = \$app->make(Illuminate\Contracts\Console\Kernel::class);
\$kernel->bootstrap();

\$user = App\Models\User::where('username', '${ADMIN_USER}')->first();
if (!\$user) {
    \$user = new App\Models\User([
        'username' => '${ADMIN_USER}',
        'realname' => 'Administrator',
        'email' => 'admin@example.com',
        'descr' => 'Default Admin User',
        'auth_type' => 'mysql',
    ]);
    \$user->setPassword('${ADMIN_PASSWORD}');
    \$user->save();
    \$user->assignRole(['admin']);
    \$user->save();
}
" || true

# Clear cached configuration to ensure INSTALL flag removal is picked up
docker compose -f docker/compose.yaml exec -T -u librenms app php artisan config:clear || true

# Verify login endpoint is ready
echo "Waiting for /login endpoint to be fully ready..."
for i in {1..30}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/login")
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "LibreNMS is ready for login (HTTP 200)!"
        exit 0
    fi
    sleep 1
done

echo "LibreNMS started, proceeding..."
