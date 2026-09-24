#!/usr/bin/env bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"
COMPOSE_FILE="${BASE_DIR}/docker/compose.yaml"

cd "${BASE_DIR}"

echo "[*] Validating Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "[*] Ensuring images are present..."
docker compose -f "${COMPOSE_FILE}" pull || true

echo "[*] Starting Alfresco multi-container environment..."
docker compose -f "${COMPOSE_FILE}" up -d

echo "[*] Waiting for services to become healthy (timeout: 180s)..."
MAX_ATTEMPTS=36
ATTEMPT=0

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
  ATTEMPT=$((ATTEMPT + 1))
  sleep 5

  if curl -s -f -o /dev/null http://localhost:18006/alfresco/api/-default-/public/alfresco/versions/1/probes/-ready- ; then
    echo "[+] All required services are healthy and ready!"
    docker compose -f "${COMPOSE_FILE}" ps
    exit 0
  fi

  UNHEALTHY=$(docker compose -f "${COMPOSE_FILE}" ps --format json 2>/dev/null | grep -i '"Health":"unhealthy"' || true)
  if [ -n "$UNHEALTHY" ]; then
    echo "[-] Service healthcheck failed. Container status:"
    docker compose -f "${COMPOSE_FILE}" ps
    exit 1
  fi

  echo "[*] Services starting up... (${ATTEMPT}/${MAX_ATTEMPTS}, waiting 5s)"
done

echo "[-] Timeout waiting for services to become healthy."
docker compose -f "${COMPOSE_FILE}" ps
docker compose -f "${COMPOSE_FILE}" logs --tail 50
exit 1
