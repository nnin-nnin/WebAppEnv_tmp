#!/bin/bash
set -e

echo "Starting Open edX LMS runtime..."

# Run database setup in background or direct python execution
python3 -c "import app; app.init_db()" || echo "Initial DB setup note: fallback in-memory user registry ready"

echo "Executing Gunicorn for Open edX LMS on port 8000..."
exec gunicorn --bind 0.0.0.0:8000 --workers 2 --timeout 120 --access-logfile - --error-logfile - app:app
