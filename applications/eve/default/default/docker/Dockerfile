FROM python:3.10-slim

ENV PYTHONUNBUFFERED=1 \
    PORT=5000 \
    MONGO_HOST=mongo \
    MONGO_PORT=27017 \
    MONGO_DBNAME=eve \
    ADMIN_USERNAME=admin \
    ADMIN_PASSWORD=AdminPassword123!

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    "https://github.com/pyeve/eve/archive/fe7d9c919bf35fe149feb42e51ba9c5c337e3119.tar.gz" \
    gunicorn==22.0.0 \
    pymongo==4.18.2

COPY run.py settings.py auth.py seed_data.py entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh

EXPOSE 5000

ENTRYPOINT ["/app/entrypoint.sh"]
