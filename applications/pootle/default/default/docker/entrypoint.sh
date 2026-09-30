#!/bin/bash
set -e

. /app/bin/activate
export POOTLE_SETTINGS=${POOTLE_SETTINGS:-/app/pootle.conf}
export HOME=/home/pootle

DB_HOST="${DB_HOST:-postgres}"
DB_PORT="${DB_PORT:-5432}"
DB_USER="${DB_USER:-pootle}"
ADMIN_USERNAME="${ADMIN_USERNAME:-admin}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"
REDIS_HOST="${REDIS_HOST:-redis}"
REDIS_PORT="${REDIS_PORT:-6379}"

mkdir -p /app/local/lib/python2.7/site-packages/pootle/log /home/pootle
chown -R pootle:pootle /app/local/lib/python2.7/site-packages/pootle/log /home/pootle /app 2>/dev/null || true

echo "Waiting for PostgreSQL at ${DB_HOST}:${DB_PORT}..."
for i in $(seq 1 60); do
    if pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" >/dev/null 2>&1; then
        echo "PostgreSQL is ready."
        break
    fi
    sleep 1
done

echo "Waiting for Redis at ${REDIS_HOST}:${REDIS_PORT}..."
python -c "
import socket, time
for i in range(30):
    try:
        s = socket.create_connection(('${REDIS_HOST}', int('${REDIS_PORT}')), timeout=2)
        s.close()
        break
    except Exception:
        time.sleep(1)
" || true

echo "Restoring Pootle revision..."
pootle revision --restore || true

echo "Configuring admin user '${ADMIN_USERNAME}'..."
pootle shell -c "
from django.contrib.auth import get_user_model
User = get_user_model()
u = User.objects.filter(username='${ADMIN_USERNAME}').first()
if u:
    u.set_password('${ADMIN_PASSWORD}')
    u.is_active = True
    u.is_superuser = True
    u.save()
    print('Admin password set successfully.')
else:
    User.objects.create_superuser('${ADMIN_USERNAME}', 'admin@example.com', '${ADMIN_PASSWORD}')
    print('Admin superuser created.')
" || true

echo "Starting Pootle server on 0.0.0.0:8000..."
exec /usr/sbin/gosu pootle /app/bin/pootle runserver 0.0.0.0:8000 --insecure
