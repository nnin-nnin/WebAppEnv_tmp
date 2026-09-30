#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18670}"
ADMIN_EMAIL="${ADMIN_USER:-${ADMIN_USERNAME:-${HEDGEDOC_USER:-admin@example.com}}}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-${HEDGEDOC_PASSWORD:-Admin123456!}}"

echo "Starting HedgeDoc 1.9.9 with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Configuring data volume permissions..."
for i in {1..20}; do
    if docker compose -f docker/compose.yaml exec -u 0 -T app chown -R 1000:1000 /data 2>/dev/null; then
        break
    fi
    sleep 1
done

echo "Waiting for HedgeDoc service to be ready on port ${HOST_PORT}..."
READY=false
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        READY=true
        echo "HedgeDoc is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 1
done

if [ "$READY" != "true" ]; then
    echo "FAILED: HedgeDoc service failed to become ready within timeout."
    exit 1
fi

echo "Initializing benchmark admin user '${ADMIN_EMAIL}'..."
docker compose -f docker/compose.yaml exec -T app node -e "
const models = require('./lib/models');
models.User.findOrCreate({
  where: { email: '${ADMIN_EMAIL}' },
  defaults: { password: '${ADMIN_PASSWORD}' }
}).then(([user, created]) => {
  if (!created) {
    user.password = '${ADMIN_PASSWORD}';
    return user.save();
  }
}).then(() => {
  process.exit(0);
}).catch((err) => {
  console.error(err);
  process.exit(1);
});
" || true

echo "HedgeDoc startup complete on port ${HOST_PORT}."
