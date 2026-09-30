#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18675}"

echo "Starting Fider 0.20.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Fider service and database to be ready..."
for i in {1..60}; do
    # Check if database has migrated tables
    if docker compose -f docker/compose.yaml exec -T db psql -U fider -d fider -c "SELECT 1 FROM information_schema.tables WHERE table_name='tenants';" 2>/dev/null | grep -q 1; then
        docker compose -f docker/compose.yaml exec -T db psql -U fider -d fider <<'EOF' >/dev/null 2>&1 || true
INSERT INTO tenants (id, name, subdomain, created_at, cname, invitation, welcome_message, status, is_private, custom_css, logo_bkey, locale, is_email_auth_allowed)
VALUES (1, 'Fider', 'default', NOW(), '', '', 'Welcome to Fider', 1, false, '', '', 'en', true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO users (id, name, email, created_at, tenant_id, role, status, avatar_type, avatar_bkey)
VALUES (1, 'Admin', 'admin@example.com', NOW(), 1, 3, 1, 0, '')
ON CONFLICT (id) DO NOTHING;
EOF
    fi

    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "Fider is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 2
done

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "ERROR: Fider failed to become ready (HTTP $HTTP_CODE)"
    docker compose -f docker/compose.yaml logs app
    exit 1
fi

echo "Fider startup complete on port ${HOST_PORT}."
