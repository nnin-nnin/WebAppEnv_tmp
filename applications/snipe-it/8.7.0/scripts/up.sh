#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_DIR="$(dirname "$DIR")"
COMPOSE_FILE="$APP_DIR/docker/compose.yaml"

export COMPOSE_PROJECT_NAME=snipeit-8-7-0

cd "$APP_DIR"

echo "Checking compose configuration..."
docker compose -f "$COMPOSE_FILE" config --quiet

echo "Pulling images..."
docker compose -f "$COMPOSE_FILE" pull

echo "Starting services..."
docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for services to be healthy..."
timeout=180
elapsed=0
while [ $elapsed -lt $timeout ]; do
  # Check if all services with healthchecks are healthy
  if ! docker compose -f "$COMPOSE_FILE" ps | grep -q "unhealthy"; then
    if docker compose -f "$COMPOSE_FILE" ps | grep -i "healthy" >/dev/null; then
      # Also check if app container is running
      if docker compose -f "$COMPOSE_FILE" ps | grep "app" | grep -qi "healthy"; then
      echo "Services are running and healthy."
      
      # Now create admin if not exists
      echo "Checking if Snipe-IT setup is completed..."
      if ! docker compose -f "$COMPOSE_FILE" exec -T app php artisan tinker --execute="if(App\Models\User::where('username', 'admin')->exists()) { exit(0); } else { exit(1); }"; then
        echo "Creating initial admin user..."
        docker compose -f "$COMPOSE_FILE" exec -T app php artisan snipeit:create-admin --first_name=Admin --last_name=Admin --email=admin@example.com --username=admin --password=changeme1234
        echo "Setting up basic application settings..."
        docker compose -f "$COMPOSE_FILE" exec -T app php artisan tinker --execute="
          if (!App\Models\Setting::first()) {
            \$s = new App\Models\Setting;
            \$s->site_name = 'Snipe-IT';
            \$s->alert_email = 'admin@example.com';
            \$s->alerts_enabled = 1;
            \$s->pwd_secure_min = 10;
            \$s->brand = 1;
            \$s->locale = 'en-US';
            \$s->default_currency = 'USD';
            \$s->email_domain = 'example.com';
            \$s->email_format = 'filastname';
            \$s->next_auto_tag_base = 1;
            \$s->full_multiple_companies_support = 0;
            \$s->save();
            echo \"Settings created.\n\";
          }
        "
      else
        echo "Admin user already exists. Skipping setup."
      fi
      exit 0
    fi
    fi
  fi
  sleep 5
  elapsed=$((elapsed + 5))
done

echo "Error: Services did not become healthy within $timeout seconds."
docker compose -f "$COMPOSE_FILE" ps
docker compose -f "$COMPOSE_FILE" logs --tail=100
exit 1
