#!/bin/bash
set -e

# Wait for DB
until pg_isready -h db -U supermarket -d supermarket_production; do
  echo "Waiting for postgres..."
  sleep 2
done

# Setup database (idempotent)
echo "DUMMY_VAR=1" > /app/.env
bundle exec rake db:setup || echo "db:setup failed but continuing, might be already initialized"
# Postgres extensions need to be added using psql
export PGPASSWORD=supermarket_password
psql -h db -U supermarket -d supermarket_production -c 'CREATE EXTENSION IF NOT EXISTS plpgsql;' || true
psql -h db -U supermarket -d supermarket_production -c 'CREATE EXTENSION IF NOT EXISTS pg_trgm;' || true

# Run migrations to be sure
bundle exec rake db:migrate

# Start the server
exec bundle exec rails server -b 0.0.0.0 -p 80
