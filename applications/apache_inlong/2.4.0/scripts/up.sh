#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$DIR/.."

cd "$PROJECT_DIR"
PROJECT_NAME="apache-inlong-2-4-0"
COMPOSE=(docker compose -p "$PROJECT_NAME" -f docker/compose.yaml)
"${COMPOSE[@]}" config --quiet
"${COMPOSE[@]}" pull

# Start the infrastructure first so Compose does not abort while MySQL is
# still initializing its schema.
"${COMPOSE[@]}" up -d mysql pulsar jobmanager taskmanager

echo "Waiting for MySQL and Pulsar..."
for i in {1..60}; do
  MYSQL_STATUS=$(docker inspect --format='{{.State.Health.Status}}' "$(${COMPOSE[@]} ps -q mysql)" 2>/dev/null || true)
  PULSAR_STATUS=$(docker inspect --format='{{.State.Health.Status}}' "$(${COMPOSE[@]} ps -q pulsar)" 2>/dev/null || true)
  if [ "$MYSQL_STATUS" = "healthy" ] && [ "$PULSAR_STATUS" = "healthy" ]; then
    break
  fi
  sleep 5
done
if [ "$MYSQL_STATUS" != "healthy" ] || [ "$PULSAR_STATUS" != "healthy" ]; then
  echo "Infrastructure did not become healthy."
  "${COMPOSE[@]}" ps
  exit 1
fi

"${COMPOSE[@]}" up -d manager audit dataproxy agent dashboard

echo "Waiting for Manager API..."
HTTP_STATUS="000"
for i in {1..90}; do
  HTTP_STATUS=$(curl --connect-timeout 2 --max-time 5 -s -o /dev/null -w "%{http_code}" \
    -X POST http://127.0.0.1:8083/inlong/manager/api/anno/login \
    -H "Content-Type: application/json" \
    -d '{"username":"admin","password":"inlong"}' || true)
  if [ "$HTTP_STATUS" = "200" ] || [ "$HTTP_STATUS" = "401" ] || [ "$HTTP_STATUS" = "403" ]; then
    break
  fi
  sleep 5
done
if [ "$HTTP_STATUS" != "200" ] && [ "$HTTP_STATUS" != "401" ] && [ "$HTTP_STATUS" != "403" ]; then
  echo "Manager API did not become reachable."
  "${COMPOSE[@]}" ps
  "${COMPOSE[@]}" logs --tail 80 manager
  exit 1
fi

# The dashboard image resolves the manager hostname at Nginx startup. Restart
# it after Manager is listening to avoid a stale upstream connection.
"${COMPOSE[@]}" restart dashboard

echo "Waiting for services to be ready..."
for i in {1..36}; do
  if "${COMPOSE[@]}" ps | grep -q "manager"; then
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:80 || echo "000")
    if [ "$HTTP_STATUS" -eq 200 ] || [ "$HTTP_STATUS" -eq 301 ] || [ "$HTTP_STATUS" -eq 302 ]; then
      echo "Services are ready!"
      exit 0
    fi
  fi
  sleep 5
done

echo "Timeout waiting for services to be ready."
"${COMPOSE[@]}" ps
"${COMPOSE[@]}" logs --tail 50
exit 1
