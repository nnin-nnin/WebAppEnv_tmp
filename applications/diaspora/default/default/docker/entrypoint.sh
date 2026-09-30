#!/bin/bash --login
set -e

cd /home/diaspora/diaspora

# Ensure runtime directories exist
mkdir -p tmp/pids tmp/cache log

DB_HOST="${DB_HOST:-postgres}"
DB_PORT="${DB_PORT:-5432}"
REDIS_HOST="${REDIS_HOST:-redis}"
REDIS_PORT="${REDIS_PORT:-6379}"

echo "Waiting for PostgreSQL ($DB_HOST:$DB_PORT)..."
while ! nc -z "$DB_HOST" "$DB_PORT"; do
  sleep 1
done
echo "PostgreSQL is reachable."

echo "Waiting for Redis ($REDIS_HOST:$REDIS_PORT)..."
while ! nc -z "$REDIS_HOST" "$REDIS_PORT"; do
  sleep 1
done
echo "Redis is reachable."

# Ensure secret token exists
if [ ! -f config/initializers/secret_token.rb ]; then
  echo "Generating session secret token..."
  bin/rake generate:secret_token
fi

# Run database setup and migrations
echo "Executing database migrations..."
RAILS_ENV=production bin/rake db:create db:migrate

# Seed initial admin account
echo "Seeding initial admin account..."
RAILS_ENV=production bin/rails runner script/seed_admin.rb

# Start Diaspora server via foreman (Puma + Sidekiq)
echo "Starting Diaspora server on port 80..."
exec script/server
