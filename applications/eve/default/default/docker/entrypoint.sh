#!/bin/bash
set -e

echo "=== Starting Eve Application Environment ==="
echo "MongoDB target: ${MONGO_HOST:-mongo}:${MONGO_PORT:-27017}"

python3 /app/seed_data.py

echo "Starting Eve REST API server via Gunicorn on 0.0.0.0:${PORT:-5000}..."
exec gunicorn -b 0.0.0.0:${PORT:-5000} --workers 2 --timeout 120 --access-logfile - --error-logfile - run:app
