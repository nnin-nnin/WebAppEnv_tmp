#!/bin/bash
set -e

# Ensure shared directories exist with proper permissions
mkdir -p /shared/uploads /shared/backups /shared/log/rails
chown -R discourse:www-data /shared

DB_HOST="${DISCOURSE_DB_HOST:-db}"
DB_PORT="${DISCOURSE_DB_PORT:-5432}"
DB_USER="${DISCOURSE_DB_USERNAME:-discourse}"
DB_PASS="${DISCOURSE_DB_PASSWORD:-discourse}"
DB_NAME="${DISCOURSE_DB_NAME:-discourse}"
REDIS_HOST="${DISCOURSE_REDIS_HOST:-redis}"
REDIS_PORT="${DISCOURSE_REDIS_PORT:-6379}"

echo "[discourse-entrypoint] Waiting for Redis at ${REDIS_HOST}:${REDIS_PORT}..."
until timeout 1 bash -c "</dev/tcp/${REDIS_HOST}/${REDIS_PORT}" 2>/dev/null; do
  sleep 1
done
echo "[discourse-entrypoint] Redis is available."

echo "[discourse-entrypoint] Waiting for PostgreSQL at ${DB_HOST}:${DB_PORT}..."
until PGPASSWORD="${DB_PASS}" pg_isready -h "${DB_HOST}" -p "${DB_PORT}" -U "${DB_USER}" -d "${DB_NAME}" >/dev/null 2>&1; do
  sleep 1
done
echo "[discourse-entrypoint] PostgreSQL is available."

# Check if database public tables exist
TABLE_COUNT=$(PGPASSWORD="${DB_PASS}" psql -h "${DB_HOST}" -p "${DB_PORT}" -U "${DB_USER}" -d "${DB_NAME}" -tAc "SELECT count(*) FROM information_schema.tables WHERE table_schema='public';" 2>/dev/null || echo "0")

if [ "${TABLE_COUNT:-0}" -lt "10" ]; then
  echo "[discourse-entrypoint] Database empty. Running schema migrations..."
  cd /var/www/discourse
  su discourse -c 'bundle exec rake db:migrate'
fi

# Ensure admin user and site settings
echo "[discourse-entrypoint] Verifying admin account and site settings..."
cd /var/www/discourse
su discourse -c 'bundle exec rails r "
  u = User.find_by_username(\"admin\") || User.find_by_email(\"admin@example.com\")
  if u.nil?
    u = User.new(username: \"admin\", email: \"admin@example.com\")
    u.password = \"AdminPassword123!\"
    u.active = true
    u.save!
    u.grant_admin!
    u.change_trust_level!(4)
    u.email_tokens.update_all(confirmed: true)
    u.activate
  else
    u.active = true
    u.save(validate: false) if !u.active
    u.grant_admin! if !u.admin?
  end
  SiteSetting.wizard_enabled = false
  SiteSetting.bypass_wizard_check = true
  SiteSetting.login_required = false
"'

echo "[discourse-entrypoint] Starting Discourse service via /sbin/boot..."
exec /sbin/boot
