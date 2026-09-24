#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18556}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin@benchmark.local}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-AdminPassword123!}}"

echo "Starting Ghost 5.89.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Ghost to initialize..."
READY=0
for i in {1..60}; do
    STATUS_JSON=$(curl -s "http://localhost:${HOST_PORT}/ghost/api/admin/authentication/setup/" 2>/dev/null || true)
    if echo "$STATUS_JSON" | grep -q '"status"'; then
        READY=1
        break
    fi
    sleep 1
done

if [ "$READY" -ne 1 ]; then
    echo "FAILED: Ghost service failed to respond within 60s"
    exit 1
fi

if echo "$STATUS_JSON" | grep -q '"status":false'; then
    echo "Initializing Ghost administrator account..."
    SETUP_RESP=$(curl -s -w "\n%{http_code}" -X POST "http://localhost:${HOST_PORT}/ghost/api/admin/authentication/setup" \
        -H "Content-Type: application/json" \
        -d "{\"setup\":[{\"name\":\"Administrator\",\"email\":\"${USERNAME}\",\"password\":\"AdminBench123!\",\"blogTitle\":\"Ghost Benchmark\"}]}")
    
    SETUP_CODE=$(echo "$SETUP_RESP" | tail -n 1)
    if [ "$SETUP_CODE" -ne 201 ]; then
        echo "FAILED: Setup API returned HTTP $SETUP_CODE"
        echo "$SETUP_RESP"
        exit 1
    fi

    echo "Applying administrator password..."
    docker compose -f docker/compose.yaml exec -T app node -e '
        const paths = ["/var/lib/ghost/current"];
        const security = require(require.resolve("@tryghost/security", { paths }));
        const Database = require(require.resolve("better-sqlite3", { paths }));
        const db = new Database("/var/lib/ghost/content/data/ghost.db");
        const email = process.argv[1];
        const password = process.argv[2];
        security.password.hash(password).then(hash => {
            db.prepare("UPDATE users SET password = ? WHERE email = ?").run(hash, email);
            console.log("Admin password updated successfully for " + email);
        });
    ' "$USERNAME" "$PASSWORD"
fi

echo "Ghost is ready at http://localhost:${HOST_PORT}!"
