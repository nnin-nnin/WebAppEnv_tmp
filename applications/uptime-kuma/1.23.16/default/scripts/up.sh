#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18656}"
USERNAME="${ADMIN_USERNAME:-${USERNAME:-${APP_USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-${APP_PASSWORD:-Admin123456!}}}"

echo "Starting uptime-kuma 1.23.16 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for uptime-kuma to become ready on port ${HOST_PORT}..."
READY=false
for i in {1..30}; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$STATUS" -eq 200 ] || [ "$STATUS" -eq 302 ]; then
        READY=true
        break
    fi
    sleep 1
done

if [ "$READY" != "true" ]; then
    echo "FAILED: uptime-kuma failed to start within timeout."
    exit 1
fi

# Initialize admin account if not already created
docker compose -f docker/compose.yaml exec -T app node -e "
const Database = require('./server/database');
const { R } = require('redbean-node');
const passwordHash = require('./server/password-hash');

(async () => {
    Database.init({});
    await Database.connect(false, false, true);
    let count = await R.count('user');
    if (count === 0) {
        let user = R.dispense('user');
        user.username = '${USERNAME}';
        user.password = passwordHash.generate('${PASSWORD}');
        await R.store(user);
        console.log('Admin user initialized successfully');
    }
    await Database.close();
})();
" >/dev/null 2>&1 || true

echo "Environment is up and ready."
