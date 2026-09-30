FROM --platform=linux/amd64 python:3.11-slim

ENV PYTHONUNBUFFERED=1 \
    PORT=8000 \
    DB_HOST=db \
    DB_PORT=3306 \
    DB_USER=openedx \
    DB_PASSWORD=openedx_password \
    DB_NAME=openedx \
    ADMIN_EMAIL=admin@example.com \
    ADMIN_USERNAME=admin \
    ADMIN_PASSWORD=AdminPassword123!

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    flask==3.0.3 \
    gunicorn==22.0.0 \
    pymysql==1.1.1 \
    cryptography==42.0.8

COPY app.py entrypoint.sh /app/
COPY templates /app/templates/
RUN chmod +x /app/entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/app/entrypoint.sh"]
