# syntax=docker/dockerfile:1

FROM node:16-bullseye AS frontend-builder

WORKDIR /build/vue
COPY source/minthcm-4.0.4/vue/package.json source/minthcm-4.0.4/vue/package-lock.json ./
RUN npm ci --no-audit --no-fund
COPY source/minthcm-4.0.4/vue/ ./
RUN npm run build

FROM docker.elastic.co/elasticsearch/elasticsearch:7.9.3 AS elasticsearch-runtime

FROM php:8.0-apache

LABEL org.opencontainers.image.title="MintHCM all-in-one"
LABEL org.opencontainers.image.version="4.0.4"
LABEL org.opencontainers.image.source="https://github.com/minthcm/minthcm.git"
LABEL org.opencontainers.image.revision="e821f829d64ad1eaea8b98f04ad2891dfbe282e8"

ENV APACHE_DOCUMENT_ROOT=/var/www/MintHCM \
    APACHE_CONFDIR=/etc/apache2 \
    MARIADB_DATABASE=minthcm \
    MARIADB_USER=minthcm \
    MARIADB_PASSWORD=minthcm-local-db \
    MINTHCM_URL=http://localhost:18520 \
    ES_HOME=/usr/share/elasticsearch \
    ES_JAVA_HOME=/usr/share/elasticsearch/jdk \
    ES_JAVA_OPTS="-Xms128m -Xmx128m -XX:MaxDirectMemorySize=512m"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       bash ca-certificates cron curl default-mysql-client \
       libfreetype6-dev libicu-dev libjpeg62-turbo-dev libpng-dev libzip-dev \
       mariadb-server procps unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" bcmath exif gd intl mysqli opcache pdo_mysql zip \
    && a2enmod headers rewrite \
    && rm -rf /var/lib/apt/lists/*

COPY --from=elasticsearch-runtime /usr/share/elasticsearch /usr/share/elasticsearch

RUN groupadd --system --gid 1000 elasticsearch \
    && useradd --system --uid 1000 --gid 1000 --home-dir /usr/share/elasticsearch --shell /usr/sbin/nologin elasticsearch \
    && mkdir -p /var/lib/elasticsearch /run/mysqld /var/log/minthcm \
    && chown -R elasticsearch:elasticsearch /usr/share/elasticsearch /var/lib/elasticsearch \
    && chown mysql:mysql /run/mysqld \
    && printf 'upload_max_filesize = 20M\npost_max_size = 20M\nmemory_limit = 512M\n' > /usr/local/etc/php/conf.d/minthcm.ini

COPY source/minthcm-4.0.4/ /var/www/MintHCM/
COPY --from=frontend-builder /build/vue/dist/ /var/www/MintHCM/vue/dist/
COPY --from=frontend-builder /build/vue/dist/assets/ /var/www/MintHCM/assets/
COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY scripts/healthcheck-container.sh /usr/local/bin/healthcheck-container.sh

# MintHCM 4.0.4's installer invokes an optional Elastic reindexer that raises
# a PHP 8 Error after the core install. Disable only that post-install action;
# the fixed source tree in source/ remains unchanged and the application API
# continues to use the bundled Elasticsearch service at runtime.
RUN sed -i 's/^[[:space:]]*\$installer->reindexElastic();[[:space:]]*$/        \/\/ reindex deferred for the all-in-one runtime/' /var/www/MintHCM/legacy/MintCLI/src/Commands/Install.php
RUN sed -i "s/'setup_db_create_database' => 1,/'setup_db_create_database' => 0,/" /var/www/MintHCM/legacy/MintCLI/src/Assets/config_si.php
RUN sed -i 's/if (!\$existanceStatus/if (false \&\& !\$existanceStatus/' /var/www/MintHCM/legacy/MintCLI/src/Commands/Install.php
RUN sed -i "/global \$argv;/a\\        \$_REQUEST['goto'] = 'SilentInstall';\\n        \$_REQUEST['cli'] = 'true';" /var/www/MintHCM/legacy/MintCLI/src/Installer/Installer.php

RUN cat > /etc/apache2/sites-available/minthcm.conf <<'EOF'
<VirtualHost *:80>
    ServerName localhost
    DocumentRoot /var/www/MintHCM
    DirectoryIndex index.html index.php
    <Directory /var/www/MintHCM>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog /proc/1/fd/2
    CustomLog /proc/1/fd/1 combined
</VirtualHost>
EOF
RUN a2dissite 000-default >/dev/null \
    && a2ensite minthcm >/dev/null \
    && chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/healthcheck-container.sh \
    && chown -R www-data:www-data /var/www/MintHCM/legacy/cache /var/www/MintHCM/legacy/custom /var/www/MintHCM/legacy/data /var/www/MintHCM/legacy/upload /var/www/MintHCM/legacy/modules /var/www/MintHCM/legacy/themes \
    && rm -f /var/www/MintHCM/index.html

WORKDIR /var/www/MintHCM
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=5s --start-period=90s --retries=8 CMD /usr/local/bin/healthcheck-container.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
