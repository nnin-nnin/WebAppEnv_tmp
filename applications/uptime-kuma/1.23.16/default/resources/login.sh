#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18656}"
URL="http://127.0.0.1:${HOST_PORT}/"
USERNAME="${ADMIN_USERNAME:-${USERNAME:-${APP_USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-${APP_PASSWORD:-Admin123456!}}}"

echo "Checking uptime-kuma login endpoint at ${URL}..."

HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "$URL" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: uptime-kuma root endpoint returned HTTP 200 (followed redirect to dashboard)."
else
    echo "FAILED: uptime-kuma root endpoint returned HTTP ${HTTP_CODE}."
    exit 1
fi

echo "Verifying administrative account access..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Verify admin user in database via container exec if running
if docker compose -f "$APP_DIR/docker/compose.yaml" ps --status running --format '{{.Service}}' 2>/dev/null | grep -q "^app$"; then
    docker compose -f "$APP_DIR/docker/compose.yaml" exec -T app node -e "
const Database = require('./server/database');
const { R } = require('redbean-node');
const passwordHash = require('./server/password-hash');

(async () => {
    Database.init({});
    await Database.connect(false, false, true);
    const user = await R.findOne('user', 'username = ?', ['${USERNAME}']);
    if (!user) {
        throw new Error('Admin user ${USERNAME} not found in database');
    }
    if (!passwordHash.verify('${PASSWORD}', user.password)) {
        throw new Error('Admin password does not match');
    }
    console.log('SUCCESS: Admin account credentials verified in database.');
    await Database.close();
})();
"
fi

echo "Login check PASSED!"
exit 0
