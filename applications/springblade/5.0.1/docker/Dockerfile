# Stage 1: Build Backend
FROM maven:3.9-eclipse-temurin-21 AS backend-builder
WORKDIR /app/backend
COPY springblade-source/ .
RUN mvn clean package -Dmaven.test.skip=true

# Stage 2: Build Frontend
FROM node:18 AS frontend-builder
WORKDIR /app/frontend
COPY saber-source/ .
RUN echo "VITE_APP_API=/api" > .env.production && \
    npm install --registry=https://registry.npmmirror.com && \
    npm run build:prod

# Stage 3: Final All-in-One Image
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV BLADE_OAUTH2_PUBLIC_KEY=049b76198474da4e2cde313d72397733becdedfda841d67d1580441ee05c77045540f5af54d1554201c0908e1261834dce90568801988391a7234089b98c947a55 \
    BLADE_OAUTH2_PRIVATE_KEY=160b8f9ea2c29969e77c35e2268376daf6c2a769fc62d57752d32290361cd28b \
    BLADE_TOKEN_SIGN_KEY=6e5f4b3a2c1d0e9f8a7b6c5d4e3f2a1b \
    BLADE_TOKEN_CRYPTO_KEY=9c8b7a6d5e4f3a2b1c0d9e8f7a6b5c4d
RUN apt-get update && apt-get install -y \
    openjdk-21-jre-headless \
    nginx \
    mysql-server \
    redis-server \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy backend jar
COPY --from=backend-builder /app/backend/target/SpringBlade.jar /app/app.jar

# Copy frontend dist
COPY --from=frontend-builder /app/frontend/dist /usr/share/nginx/html

# Copy Nginx config
COPY docker/nginx.conf /etc/nginx/sites-available/default

# Copy SQL initialization file
COPY resources/initial-data/database-seed.sql /docker-entrypoint-initdb.d/

# Copy entrypoint script
COPY scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80 8800
ENTRYPOINT ["/entrypoint.sh"]
